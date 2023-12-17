//
//  FirebaseStorageWrapper.swift
//  DocuPulse
//
//  Created by Matthew Houston on 11/19/23.
//

import Foundation
import FirebaseStorage
import FirebaseAuth
import FirebaseFirestore

enum DocumentError : Error {
    case imageDataUnavailable
}

class FirebaseStorageWrapper {
    
    typealias StorageCompletionHandler = (Result<Void, Error>) -> Void
    var firebaseDBWrapper = FirebaseDBWrapper()
    let storageReference = Storage.storage().reference()
    
    func saveCurrentUserDocument(document: UIImage, title: String, mimeType: String, completion: @escaping StorageCompletionHandler) {
        guard let currentUser = Auth.auth().currentUser else { return }
        
        guard let imageData = document.jpegData(compressionQuality: 1.00) else {
            completion(.failure(DocumentError.imageDataUnavailable))
            return
        }

        let date = Date()
        let currentDateInMilliSeconds = Int64(date.timeIntervalSince1970 * 1000)
        let documentsStoragePathReference = self.storageReference.child("documents/\(currentDateInMilliSeconds).jpeg")
        
        
        documentsStoragePathReference.putData(imageData, metadata: nil) { metadata, error in
            guard let metadata = metadata else {
                // Handle any errors
                completion(.failure(error!))
                return
            }
            

            // Document uploaded successfully
            documentsStoragePathReference.downloadURL { (url, error) in
                guard let downloadURL = url else {
                    // Handle error
                    completion(.failure(error!))
                    return
                }
                
                let currentDate = Date()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyy-MM-dd HH:mm:ss"
                let dateString = dateFormatter.string(from: currentDate)
                
                //save file path in database
                let documentData: [String: Any] = [
                    "fileURL": downloadURL.absoluteString,
                    "date": dateString,
                    "title": "title",
                    "mimeType": "jpeg"
                ]
                let userDocumentsPathRef = self.firebaseDBWrapper.databaseReference.collection("users").document(Auth.auth().currentUser!.uid).collection("documents").document()
                userDocumentsPathRef.setData(documentData) { error in
                    if let error = error {
                        print("Error writing document path to database: \(error)")
                        completion(.failure(error))
                    } else {
                        print("Document path successfully written to database")
                        completion(.success(()))
                    }
                }
            }
        }
    }
    
    func editDocument(documentPath: String) {
        
    }
}

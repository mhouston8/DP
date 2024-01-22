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
    
    var database = FirebaseDBWrapper()
    let storage = Storage.storage().reference()
    
    func saveMergedDocument(mergedDocumentData: Data, thumbnail: UIImage, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let currentUser = Auth.auth().currentUser else { return }
        
        let date = Date()
        let currentDateInMilliSeconds = Int64(date.timeIntervalSince1970 * 1000)
        let documentsStoragePathReference = self.storage.child("documents/\(currentDateInMilliSeconds).pdf")
        
        guard let imageData = thumbnail.jpegData(compressionQuality: 1.00) else {
            completion(.failure(DocumentError.imageDataUnavailable))
            return
        }
        
        documentsStoragePathReference.putData(mergedDocumentData, metadata: nil) { metadata, error in
            guard let _ = metadata else {
                completion(.failure(error!))
                return
            }
            

            // Document uploaded successfully
            documentsStoragePathReference.downloadURL { (url, error) in
                guard let downloadURL = url else {
                    completion(.failure(error!))
                    return
                }
                
                let currentDate = Date()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MM-dd-yyyy h:mm a"
                let dateString = dateFormatter.string(from: currentDate)
                
                let documentData: [String: Any] = [
                    "fileURL": downloadURL.absoluteString,
                    "date": dateString,
                    "title": "Merged Document",
                    "mimeType": "pdf",
                    "mediaCount": 1
                ]
                
                let userDocumentsPathRef = self.database.databaseReference.collection("users").document(currentUser.uid).collection("documents").document()
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
    
    func saveDocument(document: UIImage, title: String, mimeType: String, completion: @escaping StorageCompletionHandler) {
        
        guard let currentUser = Auth.auth().currentUser else { return }
        
        guard let imageData = document.jpegData(compressionQuality: 0.5) else {
            completion(.failure(DocumentError.imageDataUnavailable))
            return
        }

        let date = Date()
        let currentDateInMilliSeconds = Int64(date.timeIntervalSince1970 * 1000)
        let documentsStoragePathReference = self.storage.child("documents/\(currentDateInMilliSeconds).jpeg")
        
        
        documentsStoragePathReference.putData(imageData, metadata: nil) { metadata, error in
            guard let _ = metadata else {
                completion(.failure(error!))
                return
            }
            

            // Document uploaded successfully
            documentsStoragePathReference.downloadURL { (url, error) in
                guard let downloadURL = url else {
                    completion(.failure(error!))
                    return
                }
                
                let currentDate = Date()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MM-dd-yyyy h:mm a"
                let dateString = dateFormatter.string(from: currentDate)
                
                let documentData: [String: Any] = [
                    "fileURL": downloadURL.absoluteString,
                    "date": dateString,
                    "title": title,
                    "mimeType": "jpeg",
                    "mediaCount": 1
                ]
                
                let userDocumentsPathRef = self.database.databaseReference.collection("users").document(currentUser.uid).collection("documents").document()
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
    
    func getCurrentDateString() -> String {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy h:mm a"
        let dateString = dateFormatter.string(from: currentDate)
        
        return dateString
    }
    
//    func saveBatchDocuments(documents: [UIImage], completion: @escaping ([Document]) -> Void) {
//        //save to storage
//        guard let currentUser = Auth.auth().currentUser else { return }
//        
//        var documentPaths = [String]()
//        
//        let dispatchGroup = DispatchGroup()
//        
//        for (index, document) in documents.enumerated() {
//            guard let imageData = document.jpegData(compressionQuality: 1.00) else {
//                return
//            }
//            
//            let date = Date()
//            let currentDateInMilliSeconds = Int64(date.timeIntervalSince1970 * 1000)
//            let documentsStoragePathReference = self.storage.child("documents/\(currentDateInMilliSeconds).jpeg")
//            
//            dispatchGroup.enter()
//            documentsStoragePathReference.putData(imageData, metadata: nil) { metadata, error in
//                guard let _ = metadata else {
//                    return
//                }
//                
//
//                // Document uploaded successfully // save to database
//                documentsStoragePathReference.downloadURL { (url, error) in
//                    guard let downloadURL = url else {
//                        return
//                    }
//                    documentPaths.append(downloadURL.absoluteString)
//                    dispatchGroup.leave()
//                }
//            }
//        }
//        
//        dispatchGroup.notify(queue: .main) {
//            let currentDateString = self.getCurrentDateString()
//            
//            //save file path in database
//            let documentData: [String: Any] = [
//                "fileURL": "",
//                "date": currentDateString,
//                "title": "",
//                "mimeType": "jpeg",
//                "batchFiles": documentPaths,
//            ]
//            
//            let userDocumentsPathRef = self.database.databaseReference.collection("users").document(currentUser.uid).collection("documents").document()
//            userDocumentsPathRef.setData(documentData) { error in
//                if let error = error {
//                    print("Error writing document path to database: \(error)")
//                } else {
//                    print("Document path successfully written to database")
//                    self.database.readBatchDocuments(byID: userDocumentsPathRef.documentID) { documents in
//                        completion(documents)
//                    }
//                }
//            }
//        }
//    }
    
    func updateDocument(document: Document, with image: UIImage, completion: @escaping (Bool) -> Void) {
        guard let currentUser = Auth.auth().currentUser else {
            completion(false)
            return
        }
        
        guard let imageData = image.jpegData(compressionQuality: 1.0) else {
            completion(false)
            return
        }
        
        let storageReference = self.storage.storage.reference(forURL: document.fileURL)
        
        storageReference.putData(imageData) { metadata, error in
            if let error = error {
                print("Error updating document")
                completion(false)
            }
            
            print("Document was updated successfully")
            completion(true)
        }
    }
    
    func deleteDocument(document: Document, completion: @escaping (Bool) -> Void) {
        let documentStorageReference = self.storage.storage.reference(forURL: document.fileURL)
        documentStorageReference.delete { error in
            if let error = error {
                completion(false)
            } else {
                completion(true)
            }
        }
    }
}

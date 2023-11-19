//
//  FirestoreDBWrapper.swift
//  DocuPulse
//
//  Created by Matthew Houston on 11/15/23.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseDatabase
import FirebaseStorage

class FirebaseDBWrapper {
    let databaseReference = Firestore.firestore()
    let storageReference = Storage.storage().reference()
    
    func saveDocument(document: UIImage) {
        let deviceID = UIDevice.current.identifierForVendor?.uuidString
        guard let imageData = document.jpegData(compressionQuality: 1.00) else { return }

        let date = Date()
        let dateFormatter = DateFormatter()
        let currentDateString = dateFormatter.string(from: date)
        let documentsStoragePathReference = self.storageReference.child("documents/\(currentDateString).pdf")
        
        
        documentsStoragePathReference.putData(imageData, metadata: nil) { metadata, error in
            guard let metadata = metadata else {
                // Handle any errors
                return
            }
            

            // Document uploaded successfully
            documentsStoragePathReference.downloadURL { (url, error) in
                guard let downloadURL = url else {
                    // Handle error
                    return
                }
                
                
                //save file path in database
                let documentData: [String: Any] = ["document": downloadURL.absoluteString]
                let userDocumentsPathRef = self.databaseReference.collection("users").document(deviceID!).collection("documents").document()
                userDocumentsPathRef.setData(documentData) { error in
                    if let error = error {
                        print("Error writing document path to database: \(error)")
                    } else {
                        print("Document path successfully written to database")
                    }
                }
            }
        }
    }
    
    
    func readDocument() {
        
    }
    
    func editDocument() {
        
    }
    
    func deleteDocument() {
        
    }
    
}

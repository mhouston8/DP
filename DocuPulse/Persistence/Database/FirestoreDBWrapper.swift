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
import FirebaseAuth

class FirebaseDBWrapper {
    let databaseReference = Firestore.firestore()
    let storageReference = Storage.storage().reference()
    
    func saveDocument(document: UIImage) {
        guard let imageData = document.jpegData(compressionQuality: 1.00) else { return }

        let date = Date()
        let currentDateInMilliSeconds = Int64(date.timeIntervalSince1970 * 1000)
        let documentsStoragePathReference = self.storageReference.child("documents/\(currentDateInMilliSeconds)")
        
        
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
                let documentData: [String: Any] = ["pathToFile": downloadURL.absoluteString]
                let userDocumentsPathRef = self.databaseReference.collection("users").document(Auth.auth().currentUser!.uid).collection("documents").document()
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
    
    func saveUser(user: User) {
        databaseReference.collection("users").document(Auth.auth().currentUser!.uid).setData([:]) { error in
            if let error = error {
                print("")
            } else {
                print("")
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

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
    var databaseReference = Firestore.firestore()
    
    func saveDocument(document: UIImage) {
        let deviceID = UIDevice.current.identifierForVendor?.uuidString
        
        guard let imageData = document.jpegData(compressionQuality: 0.75) else {
            // Handle the error if the image data could not be obtained
            return
        }

        let storageRef = Storage.storage().reference().child("document/myImage.jpg")
        
        storageRef.putData(imageData, metadata: nil) { metadata, error in
            guard let metadata = metadata else {
                // Handle any errors
                return
            }

            // Image uploaded successfully
            // You can also retrieve the download URL if needed
            storageRef.downloadURL { (url, error) in
                guard let downloadURL = url else {
                    // Handle error
                    return
                }
                
                let documentData: [String: Any] = ["document": downloadURL.absoluteString]
                let userDocumentsPathRef = self.databaseReference.collection("users").document(deviceID!).collection("documents").document()
                userDocumentsPathRef.setData(documentData) { error in
                    if let error = error {
                        print("Error writing document path: \(error)")
                    } else {
                        print("Document path successfully written!")
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

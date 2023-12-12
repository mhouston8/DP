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

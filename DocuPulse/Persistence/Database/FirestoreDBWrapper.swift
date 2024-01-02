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
                print("\(error.localizedDescription)")
            } else {
                print("")
            }
        }
    }
    
    func readAllDocuments(completion: @escaping ([Document]) -> Void) {
        guard let userID = Auth.auth().currentUser?.uid else {
            completion([])
            return
        }
        
        let allUserDocumentsReference = databaseReference.collection("users").document(userID).collection("documents").order(by: "date", descending: true)
        
        allUserDocumentsReference.getDocuments { snapshot, error in
            if let error = error {
                print("\(error.localizedDescription)")
                completion([])
                return
            }
            
            
            if snapshot!.documents.count > 0 {
                var docs = [Document]()
                for document in snapshot!.documents {
                    let dataDictionaryRepresentation = self.prepareDataForDecoding(document: document)
                    guard let dataJSONRepresentation = try? JSONSerialization.data(withJSONObject: dataDictionaryRepresentation) else {
                        return
                    }
                    
                    let decoder = JSONDecoder()
                    do {
                        let doc = try decoder.decode(Document.self, from: dataJSONRepresentation)
                        docs.append(doc)
                    } catch let jsonError {
                        print(jsonError)
                    }
                }
                
                completion(docs)
            } else {
                completion([])
            }
        }
    }
    
    func prepareDataForDecoding(document: QueryDocumentSnapshot) -> [String: Any] {
        var data = document.data() //turns document into dictionary
        data["id"] = document.documentID
        print(document.documentID)
        
        //convert firestore timestamp to date
        if let timestamp = data["date"] as? Timestamp {
            data["date"] = timestamp.dateValue()
        }
        
        return data
    }
    
    func readDocument(documentID: String) {
        
    }
    
    func updateDocument(documentID: String, with image: UIImage) {
        
    }
    
    func deleteDocument(document: Document, completion: @escaping (Bool) -> Void) {
        guard let currentUser = Auth.auth().currentUser else {
            completion(false)
            return
        }
        
        let documentReference  = self.databaseReference.collection("users").document(currentUser.uid).collection("documents").document(document.id!)
        
        documentReference.delete { error in
            if let error = error {
                print("error")
                completion(false)
            } else {
                completion(true)
            }
        } 
    }
}

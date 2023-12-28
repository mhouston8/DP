//
//  MoreOptionsViewModel.swift
//  DocuPulse
//
//  Created by Matthew Houston on 12/22/23.
//

import Foundation


class MoreOptionsViewModel: ObservableObject {
    
    let storage: FirebaseStorageWrapper = FirebaseStorageWrapper()
    let database: FirebaseDBWrapper = FirebaseDBWrapper()
    
    func deleteDocument(document: Document, completion: @escaping (Bool) -> Void) {
        self.storage.deleteDocument(document: document) { success in
            if success {
                self.database.deleteDocument(document: document) { success in
                    if success {
                        print("Successfully deleted document from database and storage bucket.")
                        completion(true)
                    } else {
                        completion(false)
                    }
                }
            }
        }
    }
    
}

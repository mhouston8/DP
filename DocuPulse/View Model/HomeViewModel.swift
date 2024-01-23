//
//  HomeViewModel.swift
//  DocuPulse
//
//  Created by Matthew Houston on 12/13/23.
//

import Foundation
import Firebase
import FirebaseStorage
import FirebaseFirestore
import FirebaseAuth

class HomeViewModel: ObservableObject {
    
    var database = FirebaseDBWrapper()
    var storage = FirebaseStorageWrapper()
    @Published var documents = [Document]()
    @Published var documentUnlocked = false
    @Published var unlockedDocument: Document?
    
    func readAllDocuments() {
        self.database.readAllDocuments { documents in
            self.documents = documents
            print("Documents = \(documents)")
        }
    }
    
    func unlockDocument(document: Document, with password: String) {
        self.database.unlockDocument(document: document, with: password) { [weak self] success in
            if success {
                guard let safeSelf = self else { return }
                DispatchQueue.main.async {
                    safeSelf.documentUnlocked = true
                    safeSelf.unlockedDocument = document
                }
            }
        }
    }
}

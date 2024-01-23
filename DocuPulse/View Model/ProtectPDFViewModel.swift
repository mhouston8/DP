//
//  ProtectPDFViewModel.swift
//  DocuPulse
//
//  Created by Matthew Houston on 1/20/24.
//

import Foundation

class ProtectPDFViewModel: ObservableObject {
    
    @Published var documents: [Document] = [Document]()
    let storage = FirebaseStorageWrapper()
    let database = FirebaseDBWrapper()
    @Published var dismissPDFView = false
    
    func readDocuments() {
        self.database.readAllDocuments { documents in
            self.documents = documents
        }
    }
    
    func protectDocument(document: Document, with password: String) {
        self.database.updateDocument(document: document, with: password) { [weak self] success in
            
            guard let safeSelf = self else { return }
            
            if success {
                safeSelf.dismissPDFView = true
            } else {
                safeSelf.dismissPDFView = false
            }
        }
    }
    
}

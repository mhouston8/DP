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
    
    func readDocuments() {
        self.database.readAllDocuments { documents in
            self.documents = documents
        }
    }
    
}

//
//  FilesViewModel.swift
//  DocuPulse
//
//  Created by Matthew Houston on 12/22/23.
//

import Foundation


class FilesViewModel: ObservableObject {
    
    var storage: FirebaseStorageWrapper = FirebaseStorageWrapper()
    var database: FirebaseDBWrapper = FirebaseDBWrapper()
    @Published var documents = [Document]()
    
    func readDocuments() {
        self.database.readAllDocuments { documents in
            self.documents = documents
        }
    }
    
}

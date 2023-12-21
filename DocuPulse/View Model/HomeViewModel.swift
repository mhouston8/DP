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
    
    func readAllDocuments() {
        self.database.readAllDocuments { documents in
            self.documents = documents
            print("Documents = \(documents)")
        }
    }
}

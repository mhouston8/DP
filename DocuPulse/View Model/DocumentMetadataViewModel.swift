//
//  DocumentMetadataViewModel.swift
//  DocuPulse
//
//  Created by Matthew Houston on 12/6/23.
//

import Foundation
import Firebase
import FirebaseStorage
import FirebaseFirestore
import FirebaseAuth


class DocumentMetadataViewModel: ObservableObject {
    
    var database = FirebaseDBWrapper()
    var storage = FirebaseStorageWrapper()
    @Published var didSaveDocument = false
    
    func saveCurrentUserDocument(document: UIImage, title: String, mimeType: String) {
        self.storage.saveCurrentUserDocument(document: document, title: title, mimeType: mimeType, completion: { result in
            switch result {
            case .success():
                print("Successfully saved user document to storage")
                self.didSaveDocument = true
            case .failure(let error):
                print("Failed to save user document to server/=.")
                self.didSaveDocument = true
            }
        })
    }
}

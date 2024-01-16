//
//  DocumentScannerViewModel.swift
//  DocuPulse
//
//  Created by Matthew Houston on 10/26/23.
//

import Foundation
import SwiftUI


class DocumentScannerViewModel: ObservableObject {
    
    static let shared = DocumentScannerViewModel()
    private init() {}
    
    private var fileManager = DocumentSaver()
    private var storage = FirebaseStorageWrapper()
    private var database = FirebaseDBWrapper()
    private var firebaseDBWrapper = FirebaseDBWrapper()
    @Published var documentScannerViewDismissed = false
    @Published var scannedDocument = UIImage()
    @Published var batchScanImages = [UIImage]()
    
    func updateScannedDocument(document: UIImage) {
        self.scannedDocument = document
    }
    
    func updateBatchScanDocuments(documents: [UIImage]) {
    }
    
    func saveDocument(document: UIImage) {
        self.storage.saveDocument(document: document, title: "Sample", mimeType: "jpeg") { result in
            if case .success(let data) = result {
                
            }
        }
    }
    
    func saveBatchDocuments(documents: [UIImage]) {
        self.batchScanImages = documents
    }
}

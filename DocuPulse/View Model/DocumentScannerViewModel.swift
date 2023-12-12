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
    private var firebaseDBWrapper = FirebaseDBWrapper()
    @Published var documentScannerViewDismissed = false
    @Published var scannedDocument = UIImage()
    
    func updateScannedDocument(document: UIImage) {
        self.scannedDocument = document
    }
    
}

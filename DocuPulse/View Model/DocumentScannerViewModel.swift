//
//  DocumentScannerViewModel.swift
//  DocuPulse
//
//  Created by Matthew Houston on 10/26/23.
//

import Foundation
import SwiftUI


class DocumentScannerViewModel: ObservableObject {
    
    private var fileManager = DocumentSaver()
    private var firebaseDBWrapper = FirebaseDBWrapper()
    
    init() {
        
    }
    
    func saveScannedDocument(document: UIImage) {
        self.firebaseDBWrapper.saveDocument(document: document)
        //self.fileManager.saveScannedDocument(image: document)
    }
    
}

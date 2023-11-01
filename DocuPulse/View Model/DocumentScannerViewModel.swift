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
    
    init() {
        
    }
    
    func saveScannedDocument(document: UIImage) {
        self.fileManager.saveScannedDocument(image: document)
    }
    
}

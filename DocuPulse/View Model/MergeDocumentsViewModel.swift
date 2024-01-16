//
//  MergeDocumentsViewModel.swift
//  DocuPulse
//
//  Created by Matthew Houston on 1/2/24.
//

import Foundation
import UIKit
import PDFKit


class MergeDocumentsViewModel: ObservableObject {
    
    @Published var batchScanImages = [UIImage]()
    let storage = FirebaseStorageWrapper()
    let database = FirebaseDBWrapper()

    
    func readDocuments() {
        let scannedImages = DocumentScannerViewModel.shared.batchScanImages
        batchScanImages = scannedImages
    }
    
    func createPDF(from images: [UIImage]) -> Data? {
        let pdfData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData, CGRect(x: 0, y: 0, width: 8.5 * 72.0, height: 11 * 72.0), nil)

        guard let _ = UIGraphicsGetCurrentContext() else { return nil }

        for image in images {
            UIGraphicsBeginPDFPage()
            image.draw(in: CGRect(x: 0, y: 0, width: 8.5 * 72.0, height: 11 * 72.0))
        }

        UIGraphicsEndPDFContext()
        return pdfData as Data
    }
    
    func saveBatchDocuments(images: [UIImage]) {
        let mergedDocumentData = self.createPDF(from: images)
        
        //save to db storage and db
        self.storage.saveMergedDocument(mergedDocumentData: mergedDocumentData!) { result in
            switch result {
            case .success(let a):
                print("success")
            case .failure(let error):
                print("failure")
            }
        }
    }
}

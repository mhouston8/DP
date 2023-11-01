//
//  FileManager.swift
//  DocuPulse
//
//  Created by Matthew Houston on 9/4/23.
//

import Foundation
import UIKit

class DocumentSaver {
    func saveScannedDocument(image: UIImage) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd-HHmmss"
        let dateString = dateFormatter.string(from: Date())
        let pdfFilename = "document-\(dateString).pdf"
        
        let documentsDirectoryPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let scannedDocumentsFilePath = documentsDirectoryPath.appendingPathComponent(pdfFilename)
        
        let pdfRenderer = UIGraphicsPDFRenderer(bounds: CGRect(origin: .zero, size: image.size))
        do {
            try pdfRenderer.writePDF(to: scannedDocumentsFilePath, withActions: { pdfContext in
                pdfContext.beginPage()
                image.draw(in: CGRect(origin: .zero, size: image.size))
                print("PDF created successfully and saved to \(scannedDocumentsFilePath)")
            })
        } catch {
            print("There was an error saving the document to the ScannedDocuments directory. Error = " + error.localizedDescription)
        }
    }
}

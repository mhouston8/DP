//
//  DocumentCellViewModel.swift
//  DocuPulse
//
//  Created by Matthew Houston on 1/16/24.
//

import Foundation
import UIKit


class DocumentCellViewModel: ObservableObject {
    
    let imageFetcher: DocumentStorageFetcher = DocumentStorageFetcher()
    @Published var documentImage: UIImage?
    
    func readDocumentImage(document: Document) {
        imageFetcher.fetchDocumentFromStorage(fromURL: URL(string: document.fileURL)!) { data in
            
            guard let unwrappedData = data else { return }
            if document.mimeType == "pdf" {
                self.documentImage = self.convertPDFDataToUIImage(pdfData: unwrappedData)
            } else {
                self.documentImage = UIImage(data: unwrappedData)
            }
        }
    }
    
    func convertPDFDataToUIImage(pdfData: Data) -> UIImage? {
        // Step 1: Create a CGPDFDocument
        guard let provider = CGDataProvider(data: pdfData as CFData),
              let pdfDocument = CGPDFDocument(provider),
              let page = pdfDocument.page(at: 1) else {
            print("Oops! Something went wrong with the PDF.")
            return nil
        }

        // Step 2: Draw the PDF page into a CGContext
        let pageRect = page.getBoxRect(.mediaBox)
        UIGraphicsBeginImageContext(pageRect.size)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }

        context.saveGState()
        context.translateBy(x: 0.0, y: pageRect.size.height)
        context.scaleBy(x: 1.0, y: -1.0)
        context.drawPDFPage(page)
        context.restoreGState()

        // Step 3: Create UIImage from the context
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image
    }
    
    
}

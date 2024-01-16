//
//  PDFViewerUIViewRepresentable.swift
//  DocuPulse
//
//  Created by Matthew Houston on 12/31/23.
//

import Foundation
import SwiftUI
import PDFKit

struct PDFViewerUIViewRepresentable: UIViewRepresentable {
    
    var documentData: Data
    
    func makeUIView(context: Context) -> some PDFView {
        let pdfView = PDFView()
        pdfView.autoScales = true
        
        return pdfView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if let documentImage = UIImage(data: documentData) {
            //image data
            let pdfDocument = self.createPDFDocument(from: documentImage)
            uiView.document = pdfDocument
        } else {
            //pdf data
            let document = PDFDocument(data: documentData)
            uiView.document = document!
        }
    }
    
    private func createPDFDocument(from image: UIImage) -> PDFDocument {
        let pdfPage = PDFPage(image: image)
        let pdfDocument = PDFDocument()
        pdfDocument.insert(pdfPage!, at: 0)
        let p = self.watermarkPDF(originalDocument: pdfDocument, watermarkText: "This is watermarked")
        return p
    }
    
    func watermarkPDF(originalDocument: PDFDocument, watermarkText: String) -> PDFDocument {
        let watermarkedDocument = PDFDocument()

        //for pageIndex in 0..<originalDocument.pageCount {
            guard let page = originalDocument.page(at: 0) else { return watermarkedDocument }
            let watermarkedPage = WatermarkedPDFPage(with: page, watermarkText: watermarkText)
            watermarkedDocument.insert(watermarkedPage, at: 0)
        //}

        return watermarkedDocument
    }
    
}

class WatermarkedPDFPage: PDFPage {
    
    var watermarkText: String
    
    init(with originalPage: PDFPage, watermarkText: String) {
        self.watermarkText = watermarkText
        super.init()
        self.bounds(for: .mediaBox)
    }
    
    override func draw(with box: PDFDisplayBox, to context: CGContext) {
        // Draw the original page content
        super.draw(with: box, to: context)

        // Set up the watermark properties
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 36),
            .foregroundColor: UIColor.red.withAlphaComponent(0.5)
        ]

        // Create an attributed string with the watermark
        let attributedString = NSAttributedString(string: watermarkText, attributes: attributes)

        // Calculate the position for the watermark
        let pageBounds = self.bounds(for: box)
        let stringSize = attributedString.size()
        let x = (pageBounds.width - stringSize.width) / 2
        let y = (pageBounds.height - stringSize.height) / 2

        // Draw the watermark
        context.saveGState()
        context.translateBy(x: x, y: y)
        attributedString.draw(at: CGPoint(x: 0, y: 0))
        context.restoreGState()
        
    }
    
}

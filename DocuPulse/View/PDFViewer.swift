//
//  PDFViewer.swift
//  DocuPulse
//
//  Created by Matthew Houston on 12/31/23.
//

import SwiftUI

struct PDFViewer: View {
    
    var document: Document
    @ObservedObject var pdfViewerViewModel = PDFViewerViewModel()
    
    var body: some View {
        VStack {
            Text("\(document.date)")
            
            if let documentData = pdfViewerViewModel.documentData {
                PDFViewerUIViewRepresentable(documentData: documentData)
            }
        }
        .onAppear {
            self.pdfViewerViewModel.fetchDocumentFromStorage(document: document)
        }
    }
}

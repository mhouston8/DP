//
//  PDFViewer.swift
//  DocuPulse
//
//  Created by Matthew Houston on 12/31/23.
//

import SwiftUI

struct PDFViewer: View {
    
    var document: Document
    @StateObject var pdfViewerViewModel = PDFViewerViewModel()
    
    var body: some View {
//        GeometryReader { geometry in
//        }
        
        VStack {
                if let documentData = pdfViewerViewModel.documentData {
                    PDFViewerUIViewRepresentable(documentData: documentData)
//                            .frame(width: geometry.size.width * 1, height: geometry.size.height * 0.65)
//                            .position(x: geometry.size.width / 2, y: geometry.size.height / 2) //center
                }
        }
        //.frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight)
        .onAppear {
            self.pdfViewerViewModel.fetchDocumentFromStorage(document: document)
        }
    }
}


extension UIScreen {
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

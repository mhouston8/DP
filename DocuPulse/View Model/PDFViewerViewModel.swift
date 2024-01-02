//
//  PDFViewerViewModel.swift
//  DocuPulse
//
//  Created by Matthew Houston on 12/31/23.
//

import Foundation


class PDFViewerViewModel: ObservableObject {
 
    @Published var documentData: Data?
    let documentStorageFetcher = DocumentStorageFetcher()
    
    func fetchDocumentFromStorage(document: Document) {
        guard let url = URL(string: document.fileURL) else { return }
        self.documentStorageFetcher.fetchDocumentFromStorage(fromURL: url) { data in
            if let data = data {
                self.documentData = data
            }
        }
    }
}

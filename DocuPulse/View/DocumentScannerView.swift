//
//  DocumentScannerView.swift
//  DocuPulse
//
//  Created by Matthew Houston on 7/27/23.
//

import SwiftUI
import VisionKit

struct DocumentScannerView: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var showDocumentMetadataView: Bool
    @Binding var showMergeDocumentsView: Bool
    var caller: String
    
    init(showDocumentMetadataView: Binding<Bool> = .constant(false), showMergeDocumentsView: Binding<Bool> = .constant(false), caller: String = "") {
        _showDocumentMetadataView = showDocumentMetadataView
        _showMergeDocumentsView = showMergeDocumentsView
        self.caller = caller
    }
    
    class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        var parent: DocumentScannerView
        @ObservedObject var documentScannerViewModel = DocumentScannerViewModel.shared
        
        init(_ parent: DocumentScannerView) {
            self.parent = parent
        }
        
        func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            
            //grab the documents
            
            if self.parent.caller == Caller.MergeDocuments {
                var documents = [UIImage]()
                for pageIndex in 0..<scan.pageCount {
                    let document = scan.imageOfPage(at: pageIndex)
                    documents.append(document)
                }
                
                documentScannerViewModel.saveBatchDocuments(documents: documents)
                self.parent.presentationMode.wrappedValue.dismiss()
                self.parent.showMergeDocumentsView = true
                
            } else {
                var scannedImage = UIImage()
                for pageIndex in 0..<scan.pageCount {
                    let image = scan.imageOfPage(at: pageIndex)
                    scannedImage = image
                }
                
                self.documentScannerViewModel.updateScannedDocument(document: scannedImage)
                parent.presentationMode.wrappedValue.dismiss()
                self.parent.showDocumentMetadataView = true
            }
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let vc = VNDocumentCameraViewController()
        vc.delegate = context.coordinator
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
}

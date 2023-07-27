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
    
    class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        var parent: DocumentScannerView
        
        init(_ parent: DocumentScannerView) {
            self.parent = parent
        }
        
        func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            parent.presentationMode.wrappedValue.dismiss()
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let vc = VNDocumentCameraViewController()
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
}

struct DocumentScannerView_Previews: PreviewProvider {
    static var previews: some View {
        DocumentScannerView()
    }
}

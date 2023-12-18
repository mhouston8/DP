//
//  MoreOptionsView.swift
//  DocuPulse
//
//  Created by Matthew Houston on 7/24/23.
//

import SwiftUI

struct MoreOptionsView: View {
    
    @State var showWatermarkScreen = false
    
    var document: Document
    
    var body: some View {
        
        ScrollView {
            VStack {
                DocumentCell(document: Document(documentID: "", title: "", imageURL: "", mimeType: "", dateString: ""))
                    .padding(.top)
                
                Divider()
                    .padding(.top)
                
                VStack(spacing: 20) {
                    DocumentOptionsCell(imageName: "Save to Device", title: "Save to Device", includeChevron: true, buttonAction: {})
                    DocumentOptionsCell(imageName: "Export To", title: "Export To ...", includeChevron: true, buttonAction: {})
                    Divider()
                }
                .padding()
                
                VStack(spacing: 20) {
                    DocumentOptionsCell(imageName: "Add Watermark", title: "Add Watermark", buttonAction: {
                        self.showWatermarkScreen = true
                    })
                    DocumentOptionsCell(imageName: "Add Digital Signature", title: "Add Digital Signature", buttonAction: {})
                    DocumentOptionsCell(imageName: "Split PDF Black", title: "Split PDF", buttonAction: {})
                    DocumentOptionsCell(imageName: "Merge PDF Black", title: "Merge PDF", buttonAction: {})
                    DocumentOptionsCell(imageName: "Protect PDF Black", title: "Protect PDF", buttonAction: {})
                    DocumentOptionsCell(imageName: "Compress PDF Black", title: "Compress PDF", buttonAction: {})
                    Divider()
                }
                .padding()
                
                VStack(spacing: 20) {
                    DocumentOptionsCell(imageName: "Rename", title: "Rename", buttonAction: {})
                    DocumentOptionsCell(imageName: "Move to Folder", title: "Move to Folder", buttonAction: {})
                    DocumentOptionsCell(imageName: "Print", title: "Print", buttonAction: {})
                    DocumentOptionsCell(imageName: "Delete", title: "Delete", buttonAction: {})
                    Divider()
                }
                .padding()
                
                Spacer()
            }
            .fullScreenCover(isPresented: $showWatermarkScreen) {
                WatermarkDocumentView(document: document)
            }
        }
    }
}


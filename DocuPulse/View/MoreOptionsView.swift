//
//  MoreOptionsView.swift
//  DocuPulse
//
//  Created by Matthew Houston on 7/24/23.
//

import SwiftUI

struct MoreOptionsView: View {
    var body: some View {
        
        ScrollView {
            VStack {
                DocumentCell(document: Document(documentID: "", title: "", imageURL: "", mimeType: "", dateString: ""))
                    .padding(.top)
                
                Divider()
                    .padding(.top)
                
                VStack(spacing: 20) {
                    DocumentOptionsCell(imageName: "Save to Device", title: "Save to Device", includeChevron: true)
                    DocumentOptionsCell(imageName: "Export To", title: "Export To ...", includeChevron: true)
                    Divider()
                }
                .padding()
                
                VStack(spacing: 20) {
                    DocumentOptionsCell(imageName: "Add Watermark", title: "Add Watermark")
                    DocumentOptionsCell(imageName: "Add Digital Signature", title: "Add Digital Signature")
                    DocumentOptionsCell(imageName: "Split PDF Black", title: "Split PDF")
                    DocumentOptionsCell(imageName: "Merge PDF Black", title: "Merge PDF")
                    DocumentOptionsCell(imageName: "Protect PDF Black", title: "Protect PDF")
                    DocumentOptionsCell(imageName: "Compress PDF Black", title: "Compress PDF")
                    Divider()
                }
                .padding()
                
                VStack(spacing: 20) {
                    DocumentOptionsCell(imageName: "Rename", title: "Rename")
                    DocumentOptionsCell(imageName: "Move to Folder", title: "Move to Folder")
                    DocumentOptionsCell(imageName: "Print", title: "Print")
                    DocumentOptionsCell(imageName: "Delete", title: "Delete")
                    Divider()
                }
                .padding()
                
                Spacer()
            }
        }
    }
}

struct MoreOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        MoreOptionsView()
    }
}

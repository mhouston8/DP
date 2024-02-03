//
//  ElectronicSignatureView.swift
//  DocuPulse
//
//  Created by Matthew Houston on 1/23/24.
//

import SwiftUI

struct ElectronicSignatureView: View {
    
    var document: Document
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            BackButton {
                presentationMode.wrappedValue.dismiss()
            }
            PDFViewer(document: document)
        }
    }
}


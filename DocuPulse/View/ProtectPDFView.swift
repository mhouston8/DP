//
//  ProtectPDFView.swift
//  DocuPulse
//
//  Created by Matthew Houston on 1/20/24.
//

import SwiftUI

struct ProtectPDFView: View {
    
    @StateObject var protectPDFViewModel = ProtectPDFViewModel()
    @State private var showPasswordAlert = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            
            HStack {
                BackButton {
                    presentationMode.wrappedValue.dismiss()
                }
                Spacer()
            }
            .padding(.bottom)
            
            HStack {
                Spacer()
                Text("Select a PDF to protect")
                Spacer()
            }
            
            ScrollView {
                ForEach(self.protectPDFViewModel.documents) { document in
                    DocumentCell(document: document)
                        .onTapGesture {
                            self.showPasswordAlert = true
                        }
                }
            }
        }
        .onAppear {
            self.protectPDFViewModel.readDocuments()
        }
    }
}

#Preview {
    ProtectPDFView()
}

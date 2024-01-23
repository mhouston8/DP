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
    @State private var passwordText = ""
    @Environment(\.presentationMode) var presentationMode
    @State var document: Document?
    
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
                            self.document = document
                            self.showPasswordAlert = true
                        }
                }
            }
        }
        .onAppear {
            self.protectPDFViewModel.readDocuments()
        }
        .alert("Enter a password", isPresented: $showPasswordAlert) {
            TextField("Password", text: $passwordText)
            Button("Protect PDF", action: {
                self.protectPDFViewModel.protectDocument(document: document!, with: passwordText)
            })
        } message: {
            Text("Protect your PDF dcoument with a password for enhanced security.")
        }
        .preferredColorScheme(.light)
        .colorScheme(.light)
        .onReceive(self.protectPDFViewModel.$dismissPDFView) { dismiss in
            if dismiss {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}


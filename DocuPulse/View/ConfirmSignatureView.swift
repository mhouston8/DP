//
//  ElectronicSignatureView.swift
//  DocuPulse
//
//  Created by Matthew Houston on 1/23/24.
//

import SwiftUI

struct ConfirmSignatureView: View {

    @Environment(\.presentationMode) var presentationMode
    var document: Document
    
    init(document: Document) {
        self.document = document
        self.setupNavigationView()
    }
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                VStack {
                    
                    Spacer()
                    PDFViewer(document: document)
                    Spacer()
                    
                    Spacer()
                    HStack(spacing: 10) {
                        Spacer()
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Cancel")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.white)
                                .background(Color.gray.brightness(-0.2))
                                .cornerRadius(30)
                        }
                        Spacer()
                        Button {
                            print("")
                        } label: {
                            Text("Save")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.white)
                                .background(Color.purple)
                                .cornerRadius(30)
                        }
                        Spacer()
                    }
                    .padding(.top)
                    .background(.black)
                }
                .background(Color.black.opacity(0.9))
                .navigationTitle("Add Digital Signature")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            //
                        } label: {
                            Image(systemName: "folder")
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        }
    }
    
    func setupNavigationView() {
        // Customize navigation bar appearance using UIKit
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .black // Black background
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white] // White title
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 20)]

        // Apply the appearance to all navigation bar instances
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance

        // To make the back button white
        UINavigationBar.appearance().tintColor = .white
    }
}


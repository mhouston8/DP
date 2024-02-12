//
//  SignatureView.swift
//  DocuPulse
//
//  Created by Matthew Houston on 1/29/24.
//

import SwiftUI
import UIKit
import PencilKit

struct SignaturePadView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var canvasView = PKCanvasView()
    @State private var isDrawing = true
    var document: Document
    
    init(document: Document) {
        self.document = document
        self.setupNavigationView()
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    PKCanvasViewRepresentable(canvasView: $canvasView) { image in
                        //image
                        print("saved")
                    }
                    
                    VStack {
                        Text("Draw your signature or add from the library")
                            .padding()
                            .foregroundStyle(.white)
                            .font(.system(size: 12))
                            .background(.black.opacity(0.5))
                            .cornerRadius(30)
                            .padding(.top)
                        Spacer()
                    }
                }
                .background(.black.opacity(1.0))
    
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
                    NavigationLink {
                        ConfirmSignatureView(document: document)
                    } label: {
                        //let image = canvasView.drawing.image(from: canvasView.bounds, scale: UIScreen.main.scale)
                        Text("Continue")
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
        .tint(.white)
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

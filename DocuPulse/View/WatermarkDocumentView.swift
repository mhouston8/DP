//
//  WatermarkDocumentView.swift
//  DocuPulse
//
//  Created by Matthew Houston on 12/17/23.
//

import SwiftUI
import UIKit

struct WatermarkDocumentView: View {
    
    @ObservedObject var watermarkDocumentViewModel = WatermarkDocumentViewModel()
    @State private var watermarkedImage: Image?
    @State private var watermarkedUIImage: UIImage?
    @State private var userDidWatermarkDocument: Bool = false
    @State private var watermarkText = ""
    @Environment(\.presentationMode) var presentationMode
    
    var document: Document
    
    var body: some View {
        VStack {
            
            HStack {
                Image(systemName: "arrow.left")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 22, height: 22)
                    .padding(.leading)
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
                Spacer()
            }
            .padding(.vertical)
            Spacer()
            
            if let originalImage = watermarkDocumentViewModel.originalImage {
                ZStack {
                    let image = Image(uiImage: originalImage)
                    
                    image
                    .resizable()
                    .frame(width: 350, height: 500)
                    .aspectRatio(contentMode: .fit)
                    
                    VStack(spacing: 50) {
                        Text(watermarkText)
                        Text(watermarkText)
                        Text(watermarkText)
                        Text(watermarkText)
                        Text(watermarkText)
                        Text(watermarkText)
                        Text(watermarkText)
                    }
                    .rotationEffect(Angle(degrees: 40))
                    .foregroundColor(.black.opacity(0.8))
                    .bold()
                }
            }
            
            Spacer()
            
            UnderlinedTextField(text: $watermarkText, placeholder: "Enter watermark text here")
            
            if userDidWatermarkDocument {
                CustomRoundButton(text: "Save") {
                    let renderer = ImageRenderer(content:
                        ZStack {
                        let image = Image(uiImage: self.watermarkDocumentViewModel.originalImage!)
                            
                            image
                            .resizable()
                            .frame(width: 1080, height: 1920)
                            .aspectRatio(contentMode: .fit)
                            
                            VStack(spacing: 50) {
                                Text(watermarkText)
                                Text(watermarkText)
                                Text(watermarkText)
                                Text(watermarkText)
                                Text(watermarkText)
                                Text(watermarkText)
                                Text(watermarkText)
                            }
                            .rotationEffect(Angle(degrees: 40))
                            .foregroundColor(.black.opacity(0.8))
                            .font(.system(size: 50))
                            .bold()
                        }
                    )
                    
                    let image = renderer.uiImage
                    
                    //save to db and storage
                    self.watermarkDocumentViewModel.updateDocument(document: document, watermarkedImage: image!)
                    presentationMode.wrappedValue.dismiss()
                }
            } else {
                CustomRoundButton(text: "Watermark Document") {
                    self.applyWaterMark()
                    self.userDidWatermarkDocument = true
                }
            }
        }
        .onAppear {
            self.watermarkDocumentViewModel.fetchImage(from: URL(string:document.fileURL)!)
        }
    }
    
    func applyWaterMark() {
//        if let image = self.watermarkDocumentViewModel.originalImage {
//            let renderer = ImageRenderer(content: body)
//            let image = renderer.uiImage
//            self.watermarkedImage = Image(uiImage: image!)
//            self.watermarkedUIImage = image
//        }
    }
}



//
//VStack(spacing: 50) {
//    Text(watermarkText)
//    Text(watermarkText)
//    Text(watermarkText)
//    Text(watermarkText)
//    Text(watermarkText)
//}
//.rotationEffect(Angle(degrees: 40))
//.foregroundColor(.gray.opacity(5.0))

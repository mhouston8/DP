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
    @State private var watermarkText = ""
    
    var document: Document
    @Environment(\.presentationMode) var presentationMode
    
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
            
            if let watermarkedImage = watermarkedImage {
                watermarkedImage
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350, height: 500)
            } else {
                AsyncImage(url: URL(string: document.imageURL)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 350, height: 500)
            }
            
            Spacer()
            
            UnderlinedTextField(text: $watermarkText, placeholder: "Enter watermark text here")
            
            if let watermarkedImage = watermarkedImage {
                CustomRoundButton(text: "Save") {
                    //save to db and storage
                    self.watermarkDocumentViewModel.updateDocument(document: document, watermarkedImage: self.watermarkedUIImage!)
                }
            } else {
                CustomRoundButton(text: "Watermark Document") {
                    self.applyWaterMark()
                }
            }
        }
        .onAppear {
            self.watermarkDocumentViewModel.fetchImage(from: URL(string:document.imageURL)!)
        }
    }
    
    func applyWaterMark() {
        if let image = self.watermarkDocumentViewModel.originalImage {
            let renderer = UIGraphicsImageRenderer(size: image.size)
            let watermarkedImage = renderer.image { context in
                        image.draw(at: CGPoint.zero)
                        
                        let attributes: [NSAttributedString.Key: Any] = [
                            .font: UIFont.boldSystemFont(ofSize: 150),
                            .foregroundColor: UIColor.black
                        ]
                        
                        let string = NSAttributedString(string: "yooooooooooooooooo", attributes: attributes)
                
                
                //underlying coregraphics context
                let context = context.cgContext
                context.translateBy(x: 0, y: image.size.height)
                context.rotate(by: -CGFloat.pi / 4) // Rotate context for diagonal text
                
//                let x = (image.size.width) / 2
//                let y = (image.size.height) / 2
                
//                var x = 0
//                var y = 0
//                
//                while x < 60 {
//                    x += 10
//                    y += 30
//                    
//                    string.draw(at: CGPoint(x: x, y: y))
//                }
                
                string.draw(at: CGPoint(x: 20, y: 20))
            }
            
            self.watermarkedUIImage = watermarkedImage
            self.watermarkedImage = Image(uiImage: watermarkedImage)
        }
    }
}

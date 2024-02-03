//
//  PKCanvasViewRepresentable.swift
//  DocuPulse
//
//  Created by Matthew Houston on 1/30/24.
//

import Foundation
import PencilKit
import SwiftUI


struct PKCanvasViewRepresentable: UIViewRepresentable {
    
    @Binding var canvasView: PKCanvasView
    let onSaved: (UIImage) -> Void
    
    func makeUIView(context: Context) -> some PKCanvasView {
        canvasView.tool = PKInkingTool(.pen, color: .white, width: 3)
        canvasView.drawingPolicy = .anyInput
        canvasView.backgroundColor = .darkGray
        
        return canvasView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        //update UI here
    }
    
    func saveSignature() {
        let image = canvasView.drawing.image(from: canvasView.bounds, scale: UIScreen.main.scale)
        onSaved(image)
    }
    
    //you can create a coordinator which will interact with the delegate.
    
}

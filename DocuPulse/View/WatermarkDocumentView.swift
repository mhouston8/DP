//
//  WatermarkDocumentView.swift
//  DocuPulse
//
//  Created by Matthew Houston on 12/17/23.
//

import SwiftUI

struct WatermarkDocumentView: View {
    
    var document: Document
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: document.imageURL)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 350, height: 350)
        }
    }
}

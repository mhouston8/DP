//
//  UnderlinedTextView.swift
//  DocuPulse
//
//  Created by Matthew Houston on 11/21/23.
//

import SwiftUI

struct UnderlinedTextField: View {
    
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        VStack {
            TextField(placeholder, text: $text)
                .padding(.bottom, 5)
            
            Rectangle()
                .frame(height: 1) // Thickness of the underline
                .foregroundColor(Color.gray.opacity(0.5))
        }
        .padding(.horizontal, 20)
    }
}

struct SecureUnderlinedTextField: View {
    
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        VStack {
            HStack {
                SecureField(placeholder, text: $text)
                    .padding(.bottom, 5)
                
                Image(systemName: "eye.slash.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .foregroundColor(.blue)
            }
            
            Rectangle()
                .frame(height: 1) // Thickness of the underline
                .foregroundColor(Color.gray.opacity(0.5))
        }
        .padding(.horizontal, 20)
    }
}

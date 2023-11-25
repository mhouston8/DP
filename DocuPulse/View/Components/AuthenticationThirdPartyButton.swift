//
//  AuthenticationThirdPartyButton.swift
//  DocuPulse
//
//  Created by Matthew Houston on 11/25/23.
//

import SwiftUI

struct AuthenticationThirdPartyButton: View {
    
    var buttonText = "Continue with Goolge"
    var logo = Image("Google Icon")
    //var action: () -> Void
    
    var body: some View {
        HStack {
            logo
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
            
            Text(buttonText)
                .foregroundColor(.secondary)
                .font(.system(size: 18, weight: .medium, design: .default))
        }
        .frame(width: 300)
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
        )
    }
}

//
//  CustomRoundButton.swift
//  DocuPulse
//
//  Created by Matthew Houston on 1/12/24.
//

import SwiftUI

struct CustomRoundButton: View {
    
    var text: String
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .padding()
                .frame(width: 300)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
        }
    }
}

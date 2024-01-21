//
//  BackButton.swift
//  DocuPulse
//
//  Created by Matthew Houston on 1/21/24.
//

import SwiftUI

struct BackButton: View {
    
    var action: () -> Void
    
    var body: some View {
        HStack {
            Image(systemName: "arrow.left")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 22, height: 22)
                .padding(.leading)
                .onTapGesture {
                    action()
                }
            Spacer()
        }
        .padding(.bottom)
    }
}

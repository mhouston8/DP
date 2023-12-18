//
//  DocumentOptionsCell.swift
//  DocuPulse
//
//  Created by Matthew Houston on 7/25/23.
//

import SwiftUI

struct DocumentOptionsCell: View {
    
    var imageName: String
    var title: String
    var includeChevron = false
    var buttonAction: () -> Void
    
    var body: some View {
        HStack {
            Button {
                buttonAction()
            } label: {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                Text(title)
                    .foregroundStyle(.black)
                
                Spacer()
                
                if includeChevron {
                    Image(systemName: "chevron.right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15)
                }
            }
        }
    }
}

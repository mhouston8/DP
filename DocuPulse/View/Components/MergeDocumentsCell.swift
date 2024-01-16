//
//  MergeDocumentsCell.swift
//  DocuPulse
//
//  Created by Matthew Houston on 1/7/24.
//

import SwiftUI

struct MergeDocumentsCell: View {
    
    var image: UIImage
    
    var body: some View {
        HStack {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            Spacer()
            VStack(alignment: .leading, spacing: 10) {
                Text("Document 1")
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .bold()
            }
            .foregroundColor(.black)
            .padding()
            .padding(.leading)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.systemGroupedBackground))
        .cornerRadius(10.0)
    }
}

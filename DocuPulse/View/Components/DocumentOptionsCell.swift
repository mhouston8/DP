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
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
            Text(title)
            
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

struct DocumentOptionsCell_Previews: PreviewProvider {
    static var previews: some View {
        DocumentOptionsCell(imageName: "", title: "")
    }
}

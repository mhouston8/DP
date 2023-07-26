//
//  ShareView.swift
//  DocuPulse
//
//  Created by Matthew Houston on 7/24/23.
//

import SwiftUI

struct ShareView: View {
    var body: some View {
        VStack {
            
            HStack{
                Spacer()
                Spacer()
                    .frame(width: 35, height: 8)
                    .background(Color(.systemGroupedBackground))
                    .cornerRadius(10)
                Spacer()
            }
            .padding(.top, 5)
            
            HStack {
                Spacer()
                Text("Share")
                    .font(.title3)
                    .bold()
                Spacer()
            }
            .padding(.top)
            
            Divider()
                .padding(.vertical)
            
            VStack(spacing: 20) {
                DocumentOptionsCell(imageName: "Share Link", title: "Share Link")
                DocumentOptionsCell(imageName: "Share PDF", title: "Share PDF")
                DocumentOptionsCell(imageName: "Share Word", title: "Share Word")
                DocumentOptionsCell(imageName: "Share JPEG", title: "Share JPEG")
                DocumentOptionsCell(imageName: "Share PNG", title: "Share PNG")
            }
            .padding()
            
            Spacer()
        }
    }
}

struct ShareView_Previews: PreviewProvider {
    static var previews: some View {
        ShareView()
    }
}

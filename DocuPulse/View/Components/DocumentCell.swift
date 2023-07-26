//
//  DocumentCell.swift
//  DocuPulse
//
//  Created by Matthew Houston on 7/25/23.
//

import SwiftUI

struct DocumentCell: View {
    
    @State private var showMoreOptionsSheet = false
    @State private var showShareSheet = false
    
    var body: some View {
        HStack {
            Image("Document")
                .resizable()
                .scaledToFit()
                .frame(height: 100)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Job Application")
                    .bold()
                Text("Letter")
                    .bold()
                Text("10/12/23 12:34pm")
                    .font(.system(size: 12, weight: .light))
            }
            .padding()
            
            HStack {
                Button {
                    self.showShareSheet.toggle()
                } label: {
                    Image("Share")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                }
                
                Button {
                    self.showMoreOptionsSheet.toggle()
                } label: {
                    Image("Ellipsis")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                }
            }
        }
        .padding()
        .background(Color(.systemGroupedBackground))
        .cornerRadius(10.0)
        .sheet(isPresented: $showShareSheet, content: {
            ShareView()
                .presentationDetents([.medium]) //show half modal
        })
        .sheet(isPresented: $showMoreOptionsSheet, content: {
            MoreOptionsView()
        })
        .onTapGesture {}
    }
}
struct DocumentCell_Previews: PreviewProvider {
    static var previews: some View {
        DocumentCell()
    }
}

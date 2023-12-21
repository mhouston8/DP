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
    var document: Document
    
    var body: some View {
        HStack {
            
            AsyncImage(url: URL(string: document.imageURL), content: { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
            }, placeholder: {
                ProgressView()
            })
            Spacer()
            
            
            VStack(alignment: .leading, spacing: 10) {
                Text(document.title)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .bold()
                Text("Letter")
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .bold()
                Text("10/12/23 12:34pm")
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 12, weight: .light))
            }
            .padding()
            .padding(.leading)
            Spacer()
            
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
        .frame(maxWidth: .infinity)
        .background(Color(.systemGroupedBackground))
        .cornerRadius(10.0)
        .sheet(isPresented: $showShareSheet, content: {
            ShareView()
                .presentationDetents([.medium]) //show half modal
        })
        .sheet(isPresented: $showMoreOptionsSheet, content: {
            MoreOptionsView(document: document)
        })
        .onTapGesture {}
    }
}

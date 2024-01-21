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
    @StateObject var documentCellViewModel = DocumentCellViewModel()
    var showAccessories = false
    
    var body: some View {
        HStack {
            if let image = documentCellViewModel.documentImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
            } else {
                ProgressView()
            }
            Spacer()
            
            VStack(alignment: .leading, spacing: 10) {
                Text(document.title)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .bold()
                Text("Letter")
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .bold()
                Text(document.date)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 12, weight: .light))
            }
            .foregroundColor(.black)
            .padding()
            .padding(.leading)
            Spacer()
            
            if showAccessories {
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
        }
        .onAppear(perform: {
            documentCellViewModel.readDocumentImage(document: document)
        })
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
    }
}

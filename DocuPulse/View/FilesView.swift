//
//  FilesView.swift
//  DocuPulse
//
//  Created by Matthew Houston on 7/27/23.
//

import SwiftUI

struct FilesView: View {
    
    @ObservedObject var filesViewModel = FilesViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                //Nav bar
                HStack {
                    Image("DocuPulse Icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        
                    
                    Text("Files")
                        .font(.title2)
                    Spacer()
                    
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .padding(.horizontal)
                    
                    Image(systemName: "ellipsis.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                }
                .padding()
                .padding(.trailing)
                
                HStack {
                    Text("Total: \(self.filesViewModel.documents.count) files")
                        .bold()
                    Spacer()
                    Image(systemName: "arrow.up.arrow.down")
                        .padding(.horizontal)
                    Image(systemName: "plus.rectangle.on.folder")
                }
                .padding()
                .padding(.trailing)
                
                ScrollView {
                    VStack {
                        ForEach(self.filesViewModel.documents) { document in
                            DocumentCell(document: document, showAccessories: true)
                        }
                    }
                }
                
            }
            .onAppear {
                self.filesViewModel.readDocuments()
            }
        }
    }
}

struct FilesView_Previews: PreviewProvider {
    static var previews: some View {
        FilesView()
    }
}

//
//  MergePDFsView.swift
//  DocuPulse
//
//  Created by Matthew Houston on 1/1/24.
//

import SwiftUI
import UIKit

struct MergeDocumentsView: View {

    @ObservedObject var mergeDocumentsViewModel = MergeDocumentsViewModel()
    var images = [UIImage]()
    
    var body: some View {
        VStack {
            ScrollView{
                ForEach(self.mergeDocumentsViewModel.batchScanImages, id: \.self) { image in
                    NavigationLink {
                        PDFViewer(document: Document(title: "", fileURL: "", mimeType: "", date: "", mediaCount: 0))
                    } label: {
                        MergeDocumentsCell(image: image)
                    }
                }
                
                Divider()
                Spacer()
            }
            
            CustomRoundButton(text: "Merge Documents") {
                //action
                self.mergeDocumentsViewModel.saveBatchDocuments(images: self.mergeDocumentsViewModel.batchScanImages)
            }
        }
        .navigationTitle("Merge")
        .padding(.top)
        .onAppear {
            self.mergeDocumentsViewModel.readDocuments()
        }
    }
}

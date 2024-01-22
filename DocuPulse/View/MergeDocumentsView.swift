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
    @Environment(\.presentationMode) var presentationMode
    var images = [UIImage]()
    
    var body: some View {
        VStack {

            
            ScrollView {
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
                self.mergeDocumentsViewModel.saveBatchDocuments(images: self.mergeDocumentsViewModel.batchScanImages, completion: { success in
                    if success {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                })
            }
        }
        .navigationTitle("Merge")
        .padding(.top)
        .onAppear {
            self.mergeDocumentsViewModel.readDocuments()
        }
        .onReceive(mergeDocumentsViewModel.$didFinishMergingDocuments, perform: { didFinish in
            if didFinish {
                self.presentationMode.wrappedValue.dismiss()
            }
        })
    }
}

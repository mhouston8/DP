//
//  DocumentMetadataView.swift
//  DocuPulse
//
//  Created by Matthew Houston on 12/6/23.
//

import SwiftUI

struct DocumentMetadataView: View {
    @State var documentTitle = ""
    @State var documentPickerSelection = ""
    var mimeTypes = ["Image","PDF","JPEG", "PNG"]
    @ObservedObject var documentMetadataViewModel = DocumentMetadataViewModel()
    var document: UIImage
    
    init(document: UIImage) {
        self.document = document
    }

    var body: some View {
        if documentMetadataViewModel.didSaveDocument {
            MainTabView()
        } else {
            VStack {
                Spacer()
                Text("Please give your document a title or description:")
                    .bold()
                    .padding(.vertical)
                UnderlinedTextField(text: $documentTitle, placeholder: "E.g. Job Application Letter")
                
                Spacer()
                
                Text("Please select the a file format:")
                    .bold()
                Picker("Please select a type", selection: $documentPickerSelection) {
                    ForEach(mimeTypes, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.wheel)
                
                CustomRoundButton(text: "Save Document") {
                    self.documentMetadataViewModel.saveCurrentUserDocument(document: document, title: documentTitle, mimeType: documentPickerSelection)
                }
            }
            .padding()
        }
    }
}

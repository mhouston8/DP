//
//  MergePDFsView.swift
//  DocuPulse
//
//  Created by Matthew Houston on 1/1/24.
//

import SwiftUI

struct MergePDFsView: View {
    
    var documents: [UIImage]
    
    var body: some View {
        VStack {
            Text("\(documents.count) number of documents.")
        }
    }
}

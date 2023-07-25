//
//  RecentFilesView.swift
//  DocuPulse
//
//  Created by Matthew Houston on 7/24/23.
//

import SwiftUI

struct RecentFilesView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.black)
                        .frame(width: 15, height: 15)
                        .padding(.trailing)
                }
                
                Text("Recent Files")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Image(systemName: "magnifyingglass")
            }
            .padding()
            
            ScrollView {
                VStack {
                    ForEach(0..<30) { recentFile in
                        DocumentCell()
                    }
                }
            }
            
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

struct RecentFilesView_Previews: PreviewProvider {
    static var previews: some View {
        RecentFilesView()
    }
}

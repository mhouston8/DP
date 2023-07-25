//
//  RecentFilesView.swift
//  DocuPulse
//
//  Created by Matthew Houston on 7/24/23.
//

import SwiftUI

struct RecentFilesView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var showMoreOptionsSheet = false
    @State private var showShareSheet = false
    
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
                        })
                        .sheet(isPresented: $showMoreOptionsSheet, content: {
                            MoreOptionsView()
                        })
                        .onTapGesture {}
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

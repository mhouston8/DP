//
//  HomeView.swift
//  DocuPulse
//
//  Created by Matthew Houston on 7/18/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        NavigationView {
            VStack {
                VStack(alignment: .leading) {
                    HStack(spacing: 40) {
                        VStack {
                            Image("Scan Code")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            Text("Scan Code")
                                .font(.system(size: 12, weight: .semibold))
                        }
                        VStack {
                            Image("Watermark")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            Text("Watermark")
                                .font(.system(size: 12, weight: .semibold))
                        }
                        VStack {
                            Image("eSign PDF")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            Text("eSign PDF")
                                .font(.system(size: 12, weight: .semibold))
                        }
                        VStack {
                            Image("Split PDF")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            Text("Split PDF")
                                .font(.system(size: 12, weight: .semibold))
                        }
                    }
                    .padding(.top)
                    
                    HStack(spacing: 40) {
                        VStack {
                            Image("Merge PDF")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            Text("Merge PDF")
                                .font(.system(size: 12, weight: .semibold))
                        }
                        VStack {
                            Image("Protect PDF")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            Text("Protect PDF")
                                .font(.system(size: 12, weight: .semibold))
                        }
                        VStack {
                            Image("Compress PDF")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            Text("Compress PDF")
                                .font(.system(size: 12, weight: .semibold))
                        }
                        VStack {
                            Image("All Tools")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            Text("All Tools")
                                .font(.system(size: 12, weight: .semibold))
                        }
                    }
                    .padding(.top)
                    
                    .navigationTitle("DocuPulse")
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button {
                                    print("search")
                                } label: {
                                    Image(systemName: "magnifyingglass")
                                }
                            }
                        }
                    
                    Divider()
                        .padding(.top)
                }
                .padding([.top, .leading, .trailing])
                
                
                //Recent Files
                HStack {
                    Text("Recent Files")
                        .bold()
                        .font(.system(size: 25))
                    Spacer()
                    Image(systemName: "arrow.right")
                }
                .padding()
                
                ScrollView {
                    VStack {
                        ForEach(0..<15) { document in
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
                                    Image("Share")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25, height: 25)
                                    Image("Ellipsis")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25, height: 25)
                                }
                            }
                            .padding()
                            .background(Color(.systemGroupedBackground))
                        }
                    }
                }
                
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

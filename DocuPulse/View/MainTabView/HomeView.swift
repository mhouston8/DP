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
            ZStack(alignment: .bottomTrailing) {
                VStack {
                    HStack {
                        Text("DocuPulse")
                            .font(.largeTitle).bold()
                        Spacer()
                        Image(systemName: "magnifyingglass")
                    }
                    
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
                        
                        Divider()
                            .padding(.top)
                    }
                    .padding([.leading, .trailing])
                    
                    
                    //Recent Files
                    HStack {
                        Text("Recent Files")
                            .bold()
                            .font(.system(size: 25))
                        Spacer()
                        NavigationLink(destination: RecentFilesView()) {
                            Image(systemName: "arrow.right")
                                .foregroundColor(.black)
                        }

                    }
                    .padding()
                    
                    ScrollView {
                        VStack {
                            ForEach(0..<15) { document in
                                DocumentCell()
                            }
                        }
                    }
                    
                    Spacer()
                }
                .padding([.top, .leading, .trailing])
                .navigationBarHidden(true)
                
                HStack {
                    Image(systemName: "camera")
                        .frame(width: 25, height: 25)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color(red: 75 / 255, green: 104 / 255, blue: 255 / 255))
                        .clipShape(Circle())
                    Image(systemName: "photo")
                        .frame(width: 25, height: 25)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color(red: 75 / 255, green: 104 / 255, blue: 255 / 255))
                        .clipShape(Circle())
                }
                .padding(30)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

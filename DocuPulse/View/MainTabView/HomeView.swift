//
//  HomeView.swift
//  DocuPulse
//
//  Created by Matthew Houston on 7/18/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
//        GeometryReader { geometry in
//        }
        
        NavigationView {
            VStack {
                VStack {
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
                            Image("Scan Code")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            Text("Scan Code")
                                .font(.system(size: 12, weight: .semibold))
                        }
                        VStack {
                            Image("Scan Code")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            Text("Scan Code")
                                .font(.system(size: 12, weight: .semibold))
                        }
                        VStack {
                            Image("Scan Code")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            Text("Scan Code")
                                .font(.system(size: 12, weight: .semibold))
                        }
                    }
                    .padding(.top)
                    
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
                            Image("Scan Code")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            Text("Scan Code")
                                .font(.system(size: 12, weight: .semibold))
                        }
                        VStack {
                            Image("Scan Code")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            Text("Scan Code")
                                .font(.system(size: 12, weight: .semibold))
                        }
                        VStack {
                            Image("Scan Code")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            Text("Scan Code")
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
                .padding(.top)
                
                
                //Recent Files
                VStack {
                    HStack {
                        Text("Recent Files")
                            .font(.system(size: 25, weight: .bold))
                        Spacer()
                        Image(systemName: "arrow.right")
                            .foregroundColor(.purple)
                    }
                    .padding([.top, .horizontal])
                    
                    
                    //List
                    ScrollView {
                        VStack {
                            ForEach(0..<15) { row in
                                HStack {
                                    Image("Document")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 130)
                                    
                                    VStack {
                                        Text("Job Application")
                                        Text("Letter")
                                        Text("09/23/2021 10:43am")
                                    }
                                    
                                    HStack {
                                        Image("Share")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 20, height: 20)
                                        Image("Ellipsis")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 20, height: 20)
                                    }
                                }
                                .frame(width: UIScreen.main.bounds.size.width)
                                .background(Color(.systemGroupedBackground))
                                
                            }
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

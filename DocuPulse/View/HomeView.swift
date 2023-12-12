//
//  HomeView.swift
//  DocuPulse
//
//  Created by Matthew Houston on 7/18/23.
//

import SwiftUI

struct HomeView: View {

    @ObservedObject var documentScannerViewModel = DocumentScannerViewModel.shared
    private let adViewControllerRepresentable = FullScreenAdViewControllerRepresentable()
    @ObservedObject private var adCoordinator = AdCoordinator()
    @AppStorage("isPremiumSubscriber") var isPremiumSubsciber: Bool = false
    
    @State private var showPremiumSubscriptionView: Bool = false
    @State var showDocumentMetatDataView = false
    
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
                    .padding(.horizontal)
                
                    VStack(alignment: .leading) {
                        HStack(spacing: 40) {
                            if isPremiumSubsciber {
                                HomeViewCell(imageName: "Scan Code", title: "Scan Document") {
                                    adCoordinator.presentAd(from: adViewControllerRepresentable.viewController)
                                }
                            } else {
                                HomeViewCell(imageName: "Scan Code", title: "Purchase Subsciption to access") {
                                    self.showPremiumSubscriptionView.toggle()
                                }
                            }
                            HomeViewCell(imageName: "Watermark", title: "Watermark") {}
                            HomeViewCell(imageName: "eSign PDF", title: "eSign PDF") {}
                            HomeViewCell(imageName: "Split PDF", title: "Split PDF") {}
                        }
                        .padding(.top)
                        
                        HStack(spacing: 40) {
                            HomeViewCell(imageName: "Merge PDF", title: "Merge PDF") {}
                            HomeViewCell(imageName: "Protect PDF", title: "Protect PDF") {}
                            HomeViewCell(imageName: "Compress PDF", title: "Compress PDF") {}
                            HomeViewCell(imageName: "All Tools", title: "All Tools") {}
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
                    
                    Banner(bannerID: "", width: UIScreen.main.bounds.width)
                    
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
            .sheet(isPresented: $showPremiumSubscriptionView) {PayWallView()}
        }
        .onAppear() {
            adCoordinator.loadAd()
        }
        .fullScreenCover(isPresented: $adCoordinator.openDocumentScanner, content: {
            DocumentScannerView()
                .edgesIgnoringSafeArea(.all)
                .onDisappear {
                    self.showDocumentMetatDataView = true
                }
        })
        .fullScreenCover(isPresented: $showDocumentMetatDataView, content: {
            DocumentMetadataView(document: self.documentScannerViewModel.scannedDocument)
        })
        .background {
            // Add the adViewControllerRepresentable to the background so it
            // doesn't influence the placement of other views in the view hierarchy.
            adViewControllerRepresentable
              .frame(width: .zero, height: .zero)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

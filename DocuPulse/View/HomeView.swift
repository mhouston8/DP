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
    @ObservedObject var homeViewModel = HomeViewModel()
    
    @State private var showPremiumSubscriptionView: Bool = false
    @State private var moreOptionsViewDismissed = false
    @State private var showPDFViewerView: Bool = false
    @State private var showDocumentMetatDataView = false
    @State private var showMergeDocumentsView = false
    @State private var showDocumentScannerView = false
    @State private var showProtectPDFView = false
    @State private var showDocumentProtectedAlert = false
    @State private var documentPassword = ""
    @State private var currentDocument: Document?
    
    var body: some View {
        
        NavigationStack {
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
                            HomeViewCell(imageName: "Merge PDF", title: "Merge PDF") {
                                self.showDocumentScannerView = true
                            }
                            HomeViewCell(imageName: "Protect PDF", title: "Protect PDF") {
                                self.showProtectPDFView = true
                            }
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
                            if self.homeViewModel.documents.isEmpty {
                                Text("No documents found")
                                    .bold()
                                    .padding(.top, 100)
                            } else {
                                ForEach(self.homeViewModel.documents) { document in
                                    if document.isProtected {
                                        DocumentCell(document: document, showAccessories: true)
                                            .onTapGesture {
                                                self.currentDocument = document
                                                self.showDocumentProtectedAlert = true
                                            }
                                    } else {
                                        NavigationLink {
                                            PDFViewer(document: document)
                                        } label: {
                                            DocumentCell(document: document, showAccessories: true)
                                        }
                                    }
                                }
                                .navigationDestination(isPresented: $showPDFViewerView) {
                                    if let document = self.homeViewModel.unlockedDocument {
                                        PDFViewer(document: document)
                                    }
                                }
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
            .onAppear(perform: {
                adCoordinator.loadAd()
                self.homeViewModel.readAllDocuments()
            })
            .sheet(isPresented: $showPremiumSubscriptionView) {PayWallView()}
        }
        .onDisappear(perform: {
            self.moreOptionsViewDismissed = true
        })
        .fullScreenCover(isPresented: $adCoordinator.openDocumentScanner, content: {
            DocumentScannerView(showDocumentMetadataView: $showDocumentMetatDataView)
                .edgesIgnoringSafeArea(.all)
                .onDisappear {
                    self.homeViewModel.readAllDocuments()
                }
        })
        .fullScreenCover(isPresented: $showDocumentMetatDataView, content: {
            DocumentMetadataView(document: self.documentScannerViewModel.scannedDocument)
                .onDisappear {
                    self.homeViewModel.readAllDocuments()
                }
        })
        .fullScreenCover(isPresented: $showDocumentScannerView, content: {
            DocumentScannerView(showMergeDocumentsView: $showMergeDocumentsView, caller: Caller.MergeDocuments)
                .edgesIgnoringSafeArea(.all)
        })
        .fullScreenCover(isPresented: $showMergeDocumentsView, content: {
            MergeDocumentsView()
        })
        .fullScreenCover(isPresented: $showProtectPDFView, content: {
            ProtectPDFView()
        })
        .alert("Document Protected", isPresented: $showDocumentProtectedAlert) {
            TextField("Password", text: $documentPassword)
            Button("Confirm", action: {
                if let document = currentDocument {
                    self.homeViewModel.unlockDocument(document: document, with: documentPassword)
                }
            })
        } message: {
            Text("This document is protected with a password")
        }
        .background {
            // Add the adViewControllerRepresentable to the background so it
            // doesn't influence the placement of other views in the view hierarchy.
            adViewControllerRepresentable
              .frame(width: .zero, height: .zero)
        }
        .onReceive(self.homeViewModel.$documentUnlocked) { documentUnlocked in
            if documentUnlocked {
                self.showPDFViewerView = true
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct Caller {
    
    static public let MergeDocuments = "MergeDocument"
    
}


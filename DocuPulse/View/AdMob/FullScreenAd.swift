//
//  FullScreenAd.swift
//  DocuPulse
//
//  Created by Matthew Houston on 9/4/23.
//

import Foundation
import GoogleMobileAds
import SwiftUI

class AdCoordinator: NSObject, GADFullScreenContentDelegate, ObservableObject {
    private var ad: GADInterstitialAd?
    
    @Published var openDocumentScanner = false
    
    func loadAd() {
        GADInterstitialAd.load(
            withAdUnitID: "ca-app-pub-3940256099942544/4411468910", request: GADRequest()
        ) { ad, error in
            if let error = error {
                return print("Failed to load ad with error: \(error.localizedDescription)")
            }
            self.ad = ad
            self.ad?.fullScreenContentDelegate = self
        }
    }
    
    func presentAd(from viewController: UIViewController) {
        guard let fullScreenAd = ad else {
            return print("Ad wasn't ready")
        }
        
        fullScreenAd.present(fromRootViewController: viewController)
    }
    
    // MARK: - GADFullScreenContentDelegate methods
    func adDidRecordImpression(_ ad: GADFullScreenPresentingAd) {
        print("\(#function) called")
    }
    
    func adDidRecordClick(_ ad: GADFullScreenPresentingAd) {
        print("\(#function) called")
    }
    
    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("\(#function) called")
    }
    
    func adWillPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("\(#function) called")
    }
    
    
    func adWillDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("\(#function) called")
    }
    
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("\(#function) called")
        self.openDocumentScanner.toggle()
    }
    
}

struct FullScreenAdViewControllerRepresentable: UIViewControllerRepresentable {
    let viewController = UIViewController()
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}

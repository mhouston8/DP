//
//  DocuPulseApp.swift
//  DocuPulse
//
//  Created by Matthew Houston on 7/16/23.
//

import SwiftUI
import GoogleMobileAds
import FirebaseCore
import FirebaseFirestore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        GADMobileAds.sharedInstance().start()
        DispatchQueue.global().async {
            Purchases.default.initialize { result in }
        }
        
        return true
    }
}

@main
struct DocuPulseApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            //PayWallView()
            SignUpView()
            //OnboardingPageViewController()
                  .preferredColorScheme(.light)
        }
    }
}

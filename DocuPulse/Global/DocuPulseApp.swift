//
//  DocuPulseApp.swift
//  DocuPulse
//
//  Created by Matthew Houston on 7/16/23.
//

import SwiftUI
import FirebaseCore
import GoogleMobileAds
import FirebaseFirestore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        let db = Firestore.firestore()
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        ref = db.collection("users").addDocument(data: [
          "first": "Ada",
          "last": "Lovelace",
          "born": 1815
        ]) { err in
          if let err = err {
            print("Error adding document: \(err)")
          } else {
            print("Document added with ID: \(ref!.documentID)")
          }
        }

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
            OnboardingPageViewController()
                  .preferredColorScheme(.light)
        }
    }
}

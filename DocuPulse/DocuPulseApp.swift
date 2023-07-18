//
//  DocuPulseApp.swift
//  DocuPulse
//
//  Created by Matthew Houston on 7/16/23.
//

import SwiftUI

@main
struct DocuPulseApp: App {
    var body: some Scene {
        WindowGroup {
            OnboardingView()
                .preferredColorScheme(.light)
        }
    }
}

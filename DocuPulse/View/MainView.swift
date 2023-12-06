//
//  MainView.swift
//  DocuPulse
//
//  Created by Matthew Houston on 11/28/23.
//

import SwiftUI

struct MainView: View {
    
    var authenticationViewModel = AuthenticationViewModel()
    
    var body: some View {
        if authenticationViewModel.isAuthenticated {
            MainTabView()
                .onAppear {
                    print("")
                }
        } else {
            if let _ = UserDefaultsManager.shared.getValue(forKey: UserDefaultKeys.onboardingScreenSeen) {
                SignInView()
            } else {
                OnboardingPageViewController()
            }
        }
    }
}

#Preview {
    MainView()
}

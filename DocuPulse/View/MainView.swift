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
        } else {
            OnboardingPageViewController()
        }
    }
}

#Preview {
    MainView()
}

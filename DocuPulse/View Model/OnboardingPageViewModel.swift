//
//  OnboardingPageViewModel.swift
//  DocuPulse
//
//  Created by Matthew Houston on 7/18/23.
//

import Foundation


struct OnboardingPageViewModel {
    
    var onBoardingPageCount: Int {
        return OnboardingPage.getOnboardingPages().count
    }
    
    func getOnboardingPages() -> [OnboardingPage] {
        return OnboardingPage.getOnboardingPages()
    }
    
}

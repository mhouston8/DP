//
//  OnboardingPageViewModel.swift
//  DocuPulse
//
//  Created by Matthew Houston on 7/18/23.
//

import Foundation


struct OnboardingPageViewModel {
    
    var onBoardingPageCount: Int {
        return OnboardingPageModel.getOnboardingPages().count
    }
    
    func getOnboardingPages() -> [OnboardingPageModel] {
        return OnboardingPageModel.getOnboardingPages()
    }
    
}

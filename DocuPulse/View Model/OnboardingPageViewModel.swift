//
//  OnboardingPageViewModel.swift
//  DocuPulse
//
//  Created by Matthew Houston on 7/18/23.
//

import Foundation


struct OnboardingPageViewModel {
    
    
    var onBoardingPages: [OnboardingPage] {
        return [OnboardingPage(imageTitle: "Phone Mockingbird", title1: "Scan all your documents", title2: "quickly and easily", description: "Conveniently scan, save, and share in minutes. Scan anywhere with ease."),
                OnboardingPage(imageTitle: "Phone Mockingbird", title1: "You can also edit and", title2: "customize scan results", description: "Conveniently scan, save, and share in minutes. Scan anywhere with ease."),
                OnboardingPage(imageTitle: "Phone Mockingbird", title1: "Organize your documents", title2: "with DocuPulse now!", description: "Conveniently scan, save, and share in minutes. Scan anywhere with ease.")
       ]
    }
    
    var onBoardingPageCount: Int {
        return onBoardingPages.count
    }
}

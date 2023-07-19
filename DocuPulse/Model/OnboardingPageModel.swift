//
//  OnboardingModel.swift
//  DocuPulse
//
//  Created by Matthew Houston on 7/18/23.
//

import Foundation

struct OnboardingPageModel: Identifiable {
    var id = UUID()
    
    let imageTitle: String
    let title1: String
    let title2: String
    let description: String
    
    static func getOnboardingPages() -> [OnboardingPageModel] {
        return  [OnboardingPageModel(imageTitle: "Phone Mockingbird", title1: "Scan all your documents", title2: "quickly and easily", description: "Conveniently scan, save, and share in minutes. Scan anywhere with ease."),
                 OnboardingPageModel(imageTitle: "Phone Mockingbird", title1: "You can also edit and", title2: "customize scan results", description: "Conveniently scan, save, and share in minutes. Scan anywhere with ease."),
                 OnboardingPageModel(imageTitle: "Phone Mockingbird", title1: "Organize your documents", title2: "with DocuPulse now!", description: "Conveniently scan, save, and share in minutes. Scan anywhere with ease.")
        ]
    }
}

let MOCK_OnboardingPage = OnboardingPageModel(imageTitle: "Phone Mockingbird", title1: "Scan all your documents", title2: "quickly and easily", description: "Conveniently scan, save, and share in minutes. Scan anywhere with ease.")

//
//  OnboardingModel.swift
//  DocuPulse
//
//  Created by Matthew Houston on 7/18/23.
//

import Foundation

struct OnboardingPage: Identifiable {
    var id = UUID()
    
    let imageTitle: String
    let title1: String
    let title2: String
    let description: String
}

let MOCK_OnboardingPage = OnboardingPage(imageTitle: "Phone Mockingbird", title1: "Scan all your documents", title2: "quickly and easily", description: "Conveniently scan, save, and share in minutes. Scan anywhere with ease.")

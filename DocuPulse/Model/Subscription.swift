//
//  Subscriptions.swift
//  DocuPulse
//
//  Created by Matthew Houston on 7/30/23.
//

import Foundation
import SwiftUI

class Subscription: Identifiable {
    let id = UUID()
    
    let price: String
    let subscriptionDuration: String
    let backgroundColor: LinearGradient
    
    init(price: String, subscriptionDuration: String, backgroundColor: LinearGradient) {
        self.price = price
        self.subscriptionDuration = subscriptionDuration
        self.backgroundColor = backgroundColor
    }
}

let MOCK_SUBSCRIPTION = Subscription(price: "$4.99", subscriptionDuration: "1 /Month", backgroundColor: Colors.redGradient())

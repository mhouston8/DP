//
//  PremiumSubscriptionsViewModel.swift
//  DocuPulse
//
//  Created by Matthew Houston on 7/30/23.
//

import Foundation
import SwiftUI

class SubscriptionCardViewModel {
    
    var subscriptions = [Subscription]()
    
    init() {
        
    }
    
    func fetchPremiumPages() -> [Subscription] {
        let subscription = Subscription(price: "$4.99", subscriptionDuration: "1 /Month", backgroundColor: Colors.blueGradient())
        let subscription2 = Subscription(price: "$4.99", subscriptionDuration: "1 /Month", backgroundColor: Colors.yellowGradient())
        
        return [subscription, subscription2]
    }
    
}

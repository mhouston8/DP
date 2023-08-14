//
//  PremiumSubscriptionsViewModel.swift
//  DocuPulse
//
//  Created by Matthew Houston on 7/30/23.
//

import Foundation
import SwiftUI

class SubscriptionCardViewModel: ObservableObject {
    
    @Published var subscriptions = [Subscription]()
    
    init() {
        self.subscriptions = self.fetchPremiumPages()
        //self.subscriptions.append(contentsOf: self.fetchPremiumPages())
        //self.subscriptions += self.fetchPremiumPages()
    }
    
    func fetchPremiumPages() -> [Subscription] {
        let subscription1 = Subscription(price: "$4.99", subscriptionDuration: "1 /Month", backgroundColor: Colors.redGradient())
        let subscription2 = Subscription(price: "$4.99", subscriptionDuration: "1 /Month", backgroundColor: Colors.blueGradient())
        let subscription3 = Subscription(price: "$4.99", subscriptionDuration: "1 /Month", backgroundColor: Colors.yellowGradient())
        
        
        return [subscription1, subscription2, subscription3]
    }
    
}

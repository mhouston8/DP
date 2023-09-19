//
//  PurchasesViewModel.swift
//  DocuPulse
//
//  Created by Matthew Houston on 9/16/23.
//

import Foundation
import StoreKit


class PurchasesViewModel: ObservableObject {
    
    private let purchases = Purchases.default
    
    @Published var products = [SKProduct]()
    
    func requestProducts() {
        self.products = purchases.purchasedProducts
    }
    
}

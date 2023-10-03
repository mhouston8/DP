//
//  PurchasesViewModel.swift
//  DocuPulse
//
//  Created by Matthew Houston on 9/16/23.
//

import Foundation
import StoreKit


class PurchasesViewModel: NSObject, ObservableObject {
    
    private let purchases = Purchases.default
    @Published var products = [SKProduct]()
    
    func requestProducts() {
        self.products = purchases.purchasedProducts
    }
    
    func purchaseProduct(product: SKProduct) {
        SKPaymentQueue.default().add(self)
        let payment = SKPayment(product: product)
        SKPaymentQueue.default().add(payment)
    }
    
    func verifyPurchaseReceipt(transaction: SKPaymentTransaction) {
        //send to apple's servers to verify receipt.
    }
    
}

extension PurchasesViewModel: SKPaymentTransactionObserver {
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
                case .purchased, .restored:
                self.verifyPurchaseReceipt(transaction: transaction)
                UserDefaultsManager.shared.set(value: true, forKey: "isPremiumSubscriber")
                SKPaymentQueue.default().finishTransaction(transaction)
                case .failed:
                self.verifyPurchaseReceipt(transaction: transaction)
                UserDefaultsManager.shared.set(value: false, forKey: "isPremiumSubscriber")
                SKPaymentQueue.default().finishTransaction(transaction)
            default:
                break
            }
        }
    }
}

enum PurchaseError {
    
    case productNotFound
    case failedPayment
    case unknown
    
}

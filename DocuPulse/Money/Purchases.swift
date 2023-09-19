//
//  Purchases.swift
//  DocuPulse
//
//  Created by Matthew Houston on 9/10/23.
//

import Foundation
import StoreKit



class Purchases: NSObject {
    
    typealias RequestProductsResult = Result<[SKProduct], Error>
    typealias PurchaseProductResult = Result<Bool, Error>
    
    typealias RequestProductsCompletion = (RequestProductsResult) -> Void
    typealias PurchaseProductCompletion = (PurchaseProductResult) -> Void
    
    static let `default` = Purchases()
    
    override private init() {}
    
    private let productIdentifiers = Set(arrayLiteral: "barcode_year_subscription", "barcode_monthly_subscription")
    
    var products: [String: SKProduct]?
    var purchasedProducts = [SKProduct]()
    private var productRequest: SKProductsRequest?
    
    func initialize(completion: @escaping RequestProductsCompletion) {
        requestProducts(completion: completion)
    }
    
    var productRequestsCallbacks = [RequestProductsCompletion]()
    
    func requestProducts(completion: @escaping RequestProductsCompletion) {
        guard productRequestsCallbacks.isEmpty else {
            productRequestsCallbacks.append(completion)
            return
        }
        
        productRequestsCallbacks.append(completion)
        
        let productRequest = SKProductsRequest(productIdentifiers: productIdentifiers)
        productRequest.delegate = self
        productRequest.start()
        
        self.productRequest = productRequest
    }
}


extension Purchases: SKProductsRequestDelegate {
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        guard !response.products.isEmpty else {
            print("Found 0 products")
            //invoke all callbacks and clear them
            productRequestsCallbacks.forEach({ $0(.success(response.products))})
            productRequestsCallbacks.removeAll()
            return
        }
        
        var products = [String: SKProduct]()
        for skProduct in response.products {
            print("Found product: \(skProduct.productIdentifier)")
            products[skProduct.productIdentifier] = skProduct
        }
        
        self.products = products
        
        //invoke all callbacks and clear them
        productRequestsCallbacks.forEach({$0(.success(response.products))})
        productRequestsCallbacks.removeAll()
    }

    func request(_ request: SKRequest, didFailWithError error: Error) {
        print("Failed to load products with error:\n \(error)")
        productRequestsCallbacks.forEach({ $0(.failure(error))})
        productRequestsCallbacks.removeAll()
    }
}

extension SKProduct {
    var localizedPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = priceLocale
        return formatter.string(from: price)!
    }

    var title: String? {
        switch productIdentifier {
        case "barcode_month_subscription":
            return "Yerp Monthly Subscription"
        case "barcode_year_subscription":
            return "Yerp Annual Subscription"
        default:
            return nil
        }
    }
}

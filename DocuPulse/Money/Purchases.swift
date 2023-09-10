//
//  Purchases.swift
//  DocuPulse
//
//  Created by Matthew Houston on 9/10/23.
//

import Foundation
import StoreKit



class Purchases: NSObject {
    
    static let `default` = Purchases()
    
    private let productIdentifiers = Set(arrayLiteral: "barcode_year_subscription")
    
    private var productRequest: SKProductsRequest?
    
    func initialize() {
        requestProducts()
    }
    
    func requestProducts() {
        productRequest?.cancel()
        
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
            return
        }

        for product in response.products {
            print("Found product: \(product.productIdentifier)")
        }
    }

    func request(_ request: SKRequest, didFailWithError error: Error) {
        print("Failed to load products with error:\n \(error)")
    }
}

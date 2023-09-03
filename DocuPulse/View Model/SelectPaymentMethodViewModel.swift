//
//  SelectPaymentMethodViewModel.swift
//  DocuPulse
//
//  Created by Matthew Houston on 8/14/23.
//

import Foundation


class SelectPaymentMethodViewModel: ObservableObject {
    
    @Published var paymentMethods = [PaymentMethod]()
    
    
    func fetchPaymentMethods() {
        
    }
    
}

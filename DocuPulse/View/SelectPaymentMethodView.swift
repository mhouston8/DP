//
//  SelectPaymentMethodView.swift
//  DocuPulse
//
//  Created by Matthew Houston on 8/6/23.
//

import SwiftUI

struct SelectPaymentMethodView: View {
    
    @ObservedObject var selectPaymentMethodViewModel = SelectPaymentMethodViewModel()
    
    var body: some View {
        VStack {
            List(0..<3) { index in
                HStack {
                    Image("Paypal Payment")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    
                    Text("PayPal")
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .padding(3)
            }
        }
    }
}

struct SelectPaymentMethodView_Previews: PreviewProvider {
    static var previews: some View {
        SelectPaymentMethodView()
    }
}

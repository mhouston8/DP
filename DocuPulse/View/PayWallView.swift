//
//  PayWallView.swift
//  DocuPulse
//
//  Created by Matthew Houston on 9/10/23.
//

import SwiftUI
import StoreKit

struct PayWallView: View {
    
    @ObservedObject var purchasesViewModel = PurchasesViewModel()
    private var products = [SKProduct]()
    
    var body: some View {
        VStack {
            HStack {
                Text("Let's Purchase")
                    .font(.system(size: 35, weight: .semibold))
                    .foregroundColor(Color.gray).opacity(10.0)
                Spacer()
            }
            .padding([.top, .leading])
            
            HStack {
                Text("Premium!")
                    .font(.system(size: 45, weight: .bold))
                    .foregroundColor(Colors.premiumPurpleColor())
                Spacer()
            }
            .padding(.leading)
            
            Spacer()
            
            Button {
                print("")
            } label: {
                Text("Monthly subscription for $29.99")
            }
            .frame(maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .fontWeight(.semibold)
            .background(Colors.premiumPurpleColor())
            .cornerRadius(20.0)
            .padding(.horizontal)
            
            Button {
                print("")
            } label: {
                Text("Yearly subscription for $99.99")
            }
            .frame(maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .fontWeight(.semibold)
            .background(Colors.premiumPurpleColor())
            .cornerRadius(20.0)
            .padding([.horizontal, .bottom])
            
            Button {
                print("")
            } label: {
                Text("Restore Purchases")
            }
            .padding(.bottom)

        }
    }
}

struct PayWallView_Previews: PreviewProvider {
    static var previews: some View {
        PayWallView()
    }
}

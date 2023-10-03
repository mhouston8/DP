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
    @State private var products = [SKProduct]()
    @AppStorage("isPremiumSubscriber") var isPremiumSubsciber: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
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
                self.purchasesViewModel.purchaseProduct(product: self.products[0])
            } label: {
                if self.products.count > 0 {
                    Text("\(self.products[0].title ?? "nil")")
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .fontWeight(.semibold)
            .background(Colors.premiumPurpleColor())
            .cornerRadius(20.0)
            .padding(.horizontal)
            
            Button {
                self.purchasesViewModel.purchaseProduct(product: self.products[1])
            } label: {
                if self.products.count > 0 {
                    Text("\(self.products[1].title ?? "nil")")
                }
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
        .onAppear {
            purchasesViewModel.requestProducts()
            self.products = purchasesViewModel.products
        }
        .onChange(of: isPremiumSubsciber) { newValue in
            if newValue == true {
                presentationMode.wrappedValue.dismiss()
            }
        }
        
    }
}

struct PayWallView_Previews: PreviewProvider {
    static var previews: some View {
        PayWallView()
    }
}

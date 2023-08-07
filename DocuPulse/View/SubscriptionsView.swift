//
//  PremiumView.swift
//  DocuPulse
//
//  Created by Matthew Houston on 7/27/23.
//

import SwiftUI

struct SubscriptionsView: View {
    
    @State private var selectedDescription = 0
    @State var showSelectPaymentMethodsView = false
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink("", destination: SelectPaymentMethodView(), isActive: $showSelectPaymentMethodsView)
                TabView(selection: $selectedDescription) {
                    ForEach(0..<3, id: \.self) { index in
                        SubscriptionCard(showSelectPaymentMethodsView: $showSelectPaymentMethodsView)
                            .padding(.vertical, 75)
                            .frame(width: UIScreen.main.bounds.width)
                            .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .animation(.linear, value: selectedDescription)
            }
            .navigationTitle("Premium")
            //.navigationBarHidden(true)
        }
    }
}

struct PremiumView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionsView()
    }
}

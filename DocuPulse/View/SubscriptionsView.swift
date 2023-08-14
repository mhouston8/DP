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
    
    @ObservedObject var subscriptionCardViewModel = SubscriptionCardViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink("", destination: SelectPaymentMethodView(), isActive: $showSelectPaymentMethodsView)
                TabView(selection: $selectedDescription) {
                    ForEach(subscriptionCardViewModel.subscriptions.enumerated(), id: \.id) { subscription in
                        SubscriptionCard(selectedSubscription: subscription, showSelectPaymentMethodsView: $showSelectPaymentMethodsView)
                            .frame(width: UIScreen.main.bounds.width)
                            .scaleEffect(0.94)
                            .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .animation(.linear, value: selectedDescription)
            }
            .navigationTitle("Premium")
            .navigationBarTitleDisplayMode(.inline)
            //.navigationBarHidden(true)
        }
    }
}

struct PremiumView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionsView()
    }
}

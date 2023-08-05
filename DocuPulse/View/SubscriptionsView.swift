//
//  PremiumView.swift
//  DocuPulse
//
//  Created by Matthew Houston on 7/27/23.
//

import SwiftUI

struct SubscriptionsView: View {
    
    @State private var selectedDescription = 0
    
    var body: some View {
        VStack {
            TabView(selection: $selectedDescription) {
                ForEach(0..<3, id: \.self) { index in
                    SubscriptionCard()
                        .frame(width: UIScreen.main.bounds.width)
                        .tag(index)
                }
            }
            .animation(.linear, value: selectedDescription)
            .tabViewStyle(.page)
        }
        .navigationTitle("Premium")
    }
}

struct PremiumView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionsView()
    }
}

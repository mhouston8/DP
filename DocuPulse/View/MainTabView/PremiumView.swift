//
//  PremiumView.swift
//  DocuPulse
//
//  Created by Matthew Houston on 7/27/23.
//

import SwiftUI

struct PremiumView: View {
    var body: some View {
        VStack {
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<3) { card in
                        SubscriptionCard()
                            .frame(width: UIScreen.main.bounds.width)
                    }
                }
            }
            //.padding(.leading, 15)
            .padding(.trailing, -15)
        }
    }
}

struct PremiumView_Previews: PreviewProvider {
    static var previews: some View {
        PremiumView()
    }
}

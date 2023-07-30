//
//  SubscriptionFeatureItem.swift
//  DocuPulse
//
//  Created by Matthew Houston on 7/29/23.
//

import SwiftUI

struct SubscriptionFeatureItem: View {
    
    let imageTitle: String
    let feature: String
    
    var body: some View {
        HStack {
            Image(imageTitle)
                .resizable()
                .scaledToFit()
                .frame(width: 15, height: 15)
            Text(feature)
                .foregroundColor(.white)
        }
    }
}

struct SubscriptionFeatureItem_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionFeatureItem(imageTitle: "", feature: "")
    }
}

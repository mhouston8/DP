//
//  SubscriptionCard.swift
//  DocuPulse
//
//  Created by Matthew Houston on 7/28/23.
//

import SwiftUI

struct SubscriptionCard: View {

    var selectedSubscription: Subscription
    @Binding var showSelectPaymentMethodsView: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text(selectedSubscription.price)
                    .font(.largeTitle)
                    .bold()
                Text("/ " + selectedSubscription.subscriptionDuration)
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            .padding()
            .foregroundColor(.white)
            
            HStack {
                Text("Go Premium and enjoy the benefits")
                    .fontWeight(.semibold)
            }
            .foregroundColor(.white)
            
            Divider()
                .overlay(.white)
                .padding(.horizontal)
            
            Spacer()
            
            //Featured items
            HStack(spacing: 15) {
                VStack(alignment: .leading, spacing: 25) {
                    SubscriptionFeatureItem(imageTitle: "Subscription Card Checkmark", feature: "Unlimited Documents")
                    SubscriptionFeatureItem(imageTitle: "Subscription Card Checkmark", feature: "Remove Ads")
                    SubscriptionFeatureItem(imageTitle: "Subscription Card Checkmark", feature: "Remove Watermark")
                    SubscriptionFeatureItem(imageTitle: "Subscription Card Checkmark", feature: "Export to Word, Excel, JPEG, PNG")
                    SubscriptionFeatureItem(imageTitle: "Subscription Card Checkmark", feature: "HD Resolution")
                    SubscriptionFeatureItem(imageTitle: "Subscription Card Checkmark", feature: "Collage")
                    SubscriptionFeatureItem(imageTitle: "Subscription Card Checkmark", feature: "Translation")
                    SubscriptionFeatureItem(imageTitle: "Subscription Card Checkmark", feature: "Recognize Text (OCR)")
                    SubscriptionFeatureItem(imageTitle: "Subscription Card Checkmark", feature: "Remove Ads")
                    SubscriptionFeatureItem(imageTitle: "Subscription Card Checkmark", feature: "Remove Ads")
                
                }
                .padding(.bottom)
                Spacer()
            }
            .padding()
            .padding(.trailing, -20)
            
            
            Spacer()
            
            Button {
                self.showSelectPaymentMethodsView.toggle()
            } label: {
                Text("Select Plan")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                    .background(.white)
                    .cornerRadius(25.0)
                    .padding()
            }
            .padding(.bottom)

        }
        .background(selectedSubscription.backgroundColor)
        .cornerRadius(25)
        .padding()
        
    }
}

//struct SubscriptionCard_Previews: PreviewProvider {
//    static var previews: some View {
//        SubscriptionCard()
//    }
//}

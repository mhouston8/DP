//
//  SubscriptionCard.swift
//  DocuPulse
//
//  Created by Matthew Houston on 7/28/23.
//

import SwiftUI

struct SubscriptionCard: View {
    var body: some View {
        VStack {
            HStack {
                Text("$4.99")
                    .font(.title)
                    .bold()
                Text("/1 month")
                    .font(.subheadline)
            }
            .padding()
            .foregroundColor(.white)
            
            HStack {
                Text("Go Premium and enjoy the benefits")
            }
            .foregroundColor(.white)
            
            Divider()
                .overlay(.white)
                .padding(.horizontal)
            
            Spacer()
            
            Button {
                
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

        }
        .background(Color(red: 245 / 255, green: 72 / 255, blue: 74 / 255))
        .cornerRadius(25)
        .padding()
    }
}

struct SubscriptionCard_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionCard()
    }
}

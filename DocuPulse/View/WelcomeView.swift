//
//  WelcomeView.swift
//  DocuPulse
//
//  Created by Matthew Houston on 11/25/23.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack() {
            Spacer()
            Image("lets_you_in_picture")
                .padding(.bottom)
            Text("Let's you in")
                .font(.largeTitle)
            
            AuthenticationThirdPartyButton()
                .padding(.bottom)
            AuthenticationThirdPartyButton()
                .padding(.bottom)
            AuthenticationThirdPartyButton()
                .padding(.bottom)
            
            HStack {
                VStack { //horizontal divider needs to be inside of vstack
                    Divider()
                        .frame(width: 150)
                }
                Text("or")
                    .foregroundStyle(.black.opacity(0.5))
                VStack {
                    Divider()
                        .frame(width: 150)
                }
            }
            
            Spacer()
            
            Button {
               //go to login screen
            } label: {
                Text("Sign in with Email")
                    .padding()
                    .frame(width: 300)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.bottom)
            
            HStack {
                Text("Don't have an account?")
                Button {
                   
                } label: {
                    Text("Sign up")
                        .foregroundColor(Color.blue)
                }
            }
            Spacer()
        }
    }
}

#Preview {
    WelcomeView()
}

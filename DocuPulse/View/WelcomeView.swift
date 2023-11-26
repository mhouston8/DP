//
//  WelcomeView.swift
//  DocuPulse
//
//  Created by Matthew Houston on 11/25/23.
//

import SwiftUI

struct WelcomeView: View {
    
    @State var showSignInView = false
    @State var showSignUpView = false
    
    var body: some View {
        VStack() {
            
            Spacer()
            Image("lets_you_in_picture")
                .padding(.bottom)
            Text("Let's you in")
                .font(.largeTitle)
            
            AuthenticationThirdPartyButton(logo: Image("Google Icon"), text: "Continue with Google")
                .padding(.bottom)
            AuthenticationThirdPartyButton(logo: Image("Facebook Icon"), text: "Continue with Facebook")
                .padding(.bottom)
            AuthenticationThirdPartyButton(logo: Image("Apple Icon"), text: "Continue with Apple")
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
                self.showSignInView.toggle()
            } label: {
                Text("Sign in with Email")
                    .padding()
                    .frame(width: 300)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.bottom)
            .fullScreenCover(isPresented: $showSignInView, content: {
                SignInView()
            })
            
            HStack {
                Text("Don't have an account?")
                Button {
                    self.showSignUpView.toggle()
                } label: {
                    Text("Sign up")
                        .foregroundColor(Color.blue)
                }
            }
            .fullScreenCover(isPresented: $showSignUpView, content: {
                SignUpView()
            })
            Spacer()
        }
    }
}

#Preview {
    WelcomeView()
}

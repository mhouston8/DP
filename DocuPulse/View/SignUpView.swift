//
//  SignUpView.swift
//  DocuPulse
//
//  Created by Matthew Houston on 11/19/23.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var emailText = ""
    @State private var passwordText = ""
    @State private var confirmPasswordText = ""
    @State var isAuthenticationErrorAlertPresented = false
    
    @ObservedObject var authenticationViewModel = AuthenticationViewModel()
    
    var body: some View {
        
        if authenticationViewModel.isAuthenticated {
            MainTabView()
        } else {
            VStack {
                Text("Create New Account")
                    .font(.largeTitle)
                    .padding(.bottom)
                Text("Fill Your Deatils Or Continue With Social Media.")
                
                UnderlinedTextField(text: $emailText, placeholder: "Email")
                    .padding(.top)
                UnderlinedTextField(text: $passwordText, placeholder: "Password")
                    .padding(.top)
                UnderlinedTextField(text: $confirmPasswordText, placeholder: "Confirm Password")
                    .padding(.top)
                
                Spacer()
                
                Button {
                    if emailText.isEmpty && passwordText.isEmpty {
                        return
                    }
                    self.authenticationViewModel.signUpUser(email: emailText, password: passwordText)
                } label: {
                    Text("Sign Up")
                        .padding()
                        .frame(width: 300)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.bottom, 20)

            }
            .padding(.top, 50)
            .alert(isPresented: $isAuthenticationErrorAlertPresented) {
                Alert(title: Text("Important message"), message: Text("Here's the alert!"), dismissButton: .default(Text("Got it!")))
            }
        }
    }
}

//#Preview {
//    SignUpView()
//}

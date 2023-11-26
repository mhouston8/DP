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
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var authenticationViewModel = AuthenticationViewModel()
    
    var body: some View {
        
        if authenticationViewModel.isAuthenticated {
            MainTabView()
        } else {
            VStack {
                
                HStack {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .padding(.leading)
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                    Spacer()
                }
                
                Text("Create New Account")
                    .font(.largeTitle)
                    .padding(.bottom)
                Text("Fill Your Details Or Continue With Social Media.")
                
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
                
                
                HStack {
                    Text("Already have an account?")
                    Button {
                        
                    } label: {
                        Text("Sign In")
                            .foregroundStyle(Color.blue)
                    }
                }

            }
            .alert(isPresented: $authenticationViewModel.showErrorAuthenticatingAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text("There was an error logging in."),
                    dismissButton: .default(Text("Ok"))
                )
            }
            .environment(\.colorScheme, .light)
        }
    }
}

//#Preview {
//    SignUpView()
//}

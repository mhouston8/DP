//
//  SignInView.swift
//  DocuPulse
//
//  Created by Matthew Houston on 11/25/23.
//

import SwiftUI

struct SignInView: View {
    
    
    @State var emailText = ""
    @State var passwordText = ""
    @ObservedObject var authenticationViewModel = AuthenticationViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        if authenticationViewModel.isAuthenticated {
            MainTabView()
        } else {
            if authenticationViewModel.isLoggingIn {
                VStack {
                    ProgressView()
                        .progressViewStyle(.circular)
                    Text("Logging In...")
                        .foregroundStyle(.secondary)
                }
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
                    .padding(.bottom)
                    
                    UnderlinedTextField(text: $emailText, placeholder: "Email")
                        .padding()
                    UnderlinedTextField(text: $passwordText, placeholder: "Password")
                        .padding()
                    
                    CustomRoundButton(text: "Login") {
                        self.authenticationViewModel.loginUser(email: emailText, password: passwordText)
                    }.padding(.top)
                    
                    Spacer()
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
}

struct CustomRoundButton: View {
    
    var text: String
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .padding()
                .frame(width: 300)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
        }
    }
}

#Preview {
    SignInView()
}

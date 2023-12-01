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
    @State var rememberMeChecked = false
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
                            .frame(width: 22, height: 22)
                            .padding(.leading)
                            .onTapGesture {
                                presentationMode.wrappedValue.dismiss()
                            }
                        Spacer()
                    }
                    .padding(.bottom)
                    
                    HStack {
                        Text("Hello there")
                            .font(.system(size: 35))
                            .bold()
                            
                        Image(systemName: "hand.wave.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .foregroundColor(.yellow)
                        Spacer()
                    }
                    .padding()
                    
                    HStack {
                        Text("Please enter your email & password to sign in.")
                            .fontWeight(.light)
                            .padding([.leading, .bottom])
                        Spacer()
                    }
                    
                    VStack {
                        
                        HStack {
                            Text("Email")
                                .font(.system(size: 15))
                                .bold()
                            Spacer()
                        }
                        .padding(.leading)
                        UnderlinedTextField(text: $emailText, placeholder: "Email")
                            .padding(.bottom)
                    }
                    
                    VStack {
                        HStack {
                            Text("Password")
                                .font(.system(size: 15))
                                .bold()
                            Spacer()
                        }
                        .padding(.leading)
                        SecureUnderlinedTextField(text: $passwordText, placeholder: "Password")
                            .padding(.bottom)
                    }
                    
                    //Remember Me
                    HStack {
                        Toggle(isOn: $rememberMeChecked) {
                            Text("Remember Me")
                        }
                        .toggleStyle(CheckboxStyle())
                        Spacer()
                    }
                    .padding([.leading, .bottom])
                    
                    HStack {
                        Button {
                            //
                        } label: {
                            Text("Forgot Password")
                        }

                    }
                    
                    Spacer()
                    
                    CustomRoundButton(text: "Sign In") {
                        self.authenticationViewModel.loginUser(email: emailText, password: passwordText)
                    }.padding(.top)
                    
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

struct CheckboxStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            configuration.label
        }
    }
}

#Preview {
    SignInView()
}

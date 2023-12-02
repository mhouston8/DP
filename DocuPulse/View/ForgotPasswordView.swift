//
//  ForgotPasswordView.swift
//  DocuPulse
//
//  Created by Matthew Houston on 12/1/23.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    
    @State private var emailText = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
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
                Text("Forgot Password")
                    .font(.system(size: 35))
                    .bold()
                    
                Image(systemName: "key.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .foregroundColor(.yellow)
                Spacer()
            }
            .padding()
            
            Text("Enter your email address. We will send an OTP code for verification in the next step.")
                .padding(.bottom)
            
            UnderlinedTextField(text: $emailText, placeholder: "Email")
            
            Spacer()
            
            CustomRoundButton(text: "Continue") {
                
            }
            .foregroundColor(.blue)
        }
    }
}

#Preview {
    ForgotPasswordView()
}

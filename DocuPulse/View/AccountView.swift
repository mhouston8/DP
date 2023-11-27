//
//  AccountView.swift
//  DocuPulse
//
//  Created by Matthew Houston on 11/26/23.
//

import SwiftUI

struct AccountView: View {
    
    @State var authenticationViewModel = AuthenticationViewModel()
    @State var showLogOutAlert = false
    @Environment(\.presentationMode) var presentationMode
    @State var logOffUser = false
    
    var body: some View {
            VStack {
                Button {
                    self.showLogOutAlert.toggle()
                } label: {
                    Text("Log Out")
                        .foregroundStyle(.red)
                }
                .alert(isPresented: $showLogOutAlert) {
                    Alert(title: Text("Log out"),
                    message: Text("Are you sure you want to log out?"),
                          primaryButton: .destructive(Text("Yes")) {self.authenticationViewModel.logOutCurrentUser()},
                    secondaryButton: .cancel(Text("No"))
                    )
                }
            }
            .fullScreenCover(isPresented: $authenticationViewModel.userLoggedOff, content: {
                SignInView()
            })
        }
}

#Preview {
    AccountView()
}

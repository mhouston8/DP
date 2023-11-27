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
    
    var body: some View {
        
        if authenticationViewModel.isAuthenticated {
            
        }
        
        VStack {
            Button {
                self.showLogOutAlert.toggle()
            } label: {
                Text("Account View")
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
    }
}

#Preview {
    AccountView()
}

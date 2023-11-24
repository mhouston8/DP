//
//  SignUpUserViewModel.swift
//  DocuPulse
//
//  Created by Matthew Houston on 11/22/23.
//

import Foundation
import FirebaseAuth


enum AuthenticationError {
    case invalidUsername
    case invalidPassword
    case usernameTaken
}

class AuthenticationViewModel: ObservableObject {
    
    @Published var isAuthenticated = false
    @Published var authenticationError: AuthenticationError?
    @Published var user: User?

    func signUpUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            if let error = error {
                print("There was an error signing in the user:", error.localizedDescription)
                strongSelf.authenticationError = AuthenticationError.invalidUsername
                return
            }
            
            if let result = authResult {
                let signedInUser = result.user
                let user = User(firebaseUser: signedInUser)
                strongSelf.isAuthenticated = true
            }
        }
    }
    
    func loginUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            if let error = error {
                print("There was an error signing in the user.")
                return
            }
            
            if let result = authResult {
                let signedInUser = result.user
            }
        }
    }
}

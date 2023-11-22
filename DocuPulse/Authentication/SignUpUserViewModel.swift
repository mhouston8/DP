//
//  SignUpUserViewModel.swift
//  DocuPulse
//
//  Created by Matthew Houston on 11/22/23.
//

import Foundation
import FirebaseAuth


class SignUpUserViewModel {
    
    
    func signUpUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("There was an error signing in the user")
                return
            }
            
            if let result = authResult {
                let signedInUser = result.user
            }
        }
    }
    
    func loginUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
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

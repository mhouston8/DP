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
    @Published var showErrorAuthenticatingAlert = false
    @Published var isLoggingIn = false
    @Published var userLoggedOff = false
    
    init() {
        isUserLoggedIn()
    }

    func signUpUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            if let error = error {
                print("There was an error signing in the user:", error.localizedDescription)
                strongSelf.showErrorAuthenticatingAlert = true
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
        self.isLoggingIn = true
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            if let error = error {
                print("There was an error signing in the user.")
                strongSelf.showErrorAuthenticatingAlert = true
                strongSelf.isLoggingIn = false
                return
            }
            
            if let result = authResult {
                let signedInUser = result.user
                strongSelf.isAuthenticated = true
                strongSelf.isLoggingIn = false
            }
        }
    }
    
    func loginUser(email: String, password: String, completion: @escaping (Bool) -> Void) {
        self.isLoggingIn = true
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            if let error = error {
                print("There was an error signing in the user.")
                strongSelf.isLoggingIn = false
                completion(false)
                return
            }
            
            if let result = authResult {
                let signedInUser = result.user
                strongSelf.isLoggingIn = false
                completion(true)
            }
        }
    }
    
    func logOutCurrentUser() {
        do {
            try Auth.auth().signOut()
            self.isAuthenticated = false
            self.userLoggedOff = true
        } catch {
            print("There was an error logging off the user")
        }
    }
    
    func isUserLoggedIn () {
        if let user = Auth.auth().currentUser {
            self.isAuthenticated = true
        }
    }
}

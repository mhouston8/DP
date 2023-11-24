//
//  User.swift
//  DocuPulse
//
//  Created by Matthew Houston on 11/23/23.
//

import Foundation
import FirebaseAuth
import Firebase

struct User {
    var id: String
    var email: String?
    
    init(id: String, email: String) {
        self.id = id
        self.email = email
    }
    
    init(firebaseUser: FirebaseAuth.User) {
        self.id = firebaseUser.uid
        self.email = firebaseUser.email
    }
}

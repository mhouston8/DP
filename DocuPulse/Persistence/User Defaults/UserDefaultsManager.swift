//
//  UserDefaultsManager.swift
//  DocuPulse
//
//  Created by Matthew Houston on 10/2/23.
//

import Foundation


class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    private init() {}
    
    func set(value: Any?, forKey key: String){
        UserDefaults.standard.set(value, forKey: key)
    }
    
    func getValue(forKey key: String) -> Any? {
        return UserDefaults.standard.value(forKey: key)
    }
}

struct UserDefaultKeys {
    static var onboardingScreenSeen = "onboardingScreenSeen"
}

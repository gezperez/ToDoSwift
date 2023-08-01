//
//  SessionManager.swift
//  ToDoSwift
//
//  Created by Ezequiel Perez on 31/07/2023.
//

import Foundation

class LoginManager {
    private let userDefaults = UserDefaults.standard
    private let isLoggedInKey = "isLoggedIn"

    var isLoggedIn: Bool {
        get {
            return userDefaults.bool(forKey: isLoggedInKey)
        }
        set {
            userDefaults.set(newValue, forKey: isLoggedInKey)
        }
    }

    func login(username: String, password: String) -> Bool {
        // Simulate a 5-second timeout using DispatchQueue
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            // Dummy login validation. Replace this with actual authentication logic.
            if username == "user" && password == "password" {
                self.isLoggedIn = true
            } else {
                self.isLoggedIn = false
            }
        }

        // Return true to indicate the login process has started.
        return true
    }
}

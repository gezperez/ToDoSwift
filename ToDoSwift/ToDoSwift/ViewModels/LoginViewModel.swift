//
//  LoginViewModel.swift
//  ToDoSwift
//
//  Created by Ezequiel Perez on 31/07/2023.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var isLoggedIn = false
    @Published var isLoggingIn = false
    @Published var loginError = false

    private let loginManager = LoginManager()

    init() {
        // Load the login state when the view model is created
        isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
    }

    func login(username: String, password: String) {
        isLoggingIn = true // Set the isLoggingIn state immediately

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // Dummy login validation. Replace this with actual authentication logic.
            if username == "user" && password == "password" {
                self.isLoggedIn = true
                UserDefaults.standard.set(true, forKey: "isLoggedIn") // Persist the login state
            } else {
                self.isLoggedIn = false
                self.loginError = true
            }

            self.isLoggingIn = false // Update the isLoggingIn state after the delay
        }
    }

    func logout() {
        isLoggedIn = false
        UserDefaults.standard.set(false, forKey: "isLoggedIn") // Update the login state when logging out
    }
}

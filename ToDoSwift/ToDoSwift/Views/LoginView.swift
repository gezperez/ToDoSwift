//
//  LoginView.swift
//  ToDoSwift
//
//  Created by Ezequiel Perez on 31/07/2023.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject private var loginViewModel = LoginViewModel()
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        VStack {
            TextField("Username", text: $loginViewModel.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $loginViewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Login") {
                if loginViewModel.handleLogin() {
                    isLoggedIn = true
                    SessionManager.isLoggedIn = true // Persist the login state
                }
            }
            .padding()
        }
        .padding()
    }
}

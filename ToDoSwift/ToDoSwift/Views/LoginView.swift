//
//  LoginView.swift
//  ToDoSwift
//
//  Created by Ezequiel Perez on 31/07/2023.
//

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""

    @EnvironmentObject private var loginViewModel: LoginViewModel

    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Login") {
                loginViewModel.login(username: username, password: password)
            }
            .padding()
            .disabled(loginViewModel.isLoggingIn)

            if loginViewModel.isLoggingIn {
                ProgressView("Logging in...")
                    .padding()
            }
        }
        .alert(isPresented: $loginViewModel.loginError) {
            Alert(title: Text("Error"), message: Text("Invalid credentials"))
        }
        .padding()
    }
}


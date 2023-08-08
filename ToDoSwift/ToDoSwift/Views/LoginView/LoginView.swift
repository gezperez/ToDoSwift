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
    
    @State private var isSaveUserEnabled = false
    
    @StateObject private var emailViewModel = ValidatedTextFieldViewModel(validationRule: isValidEmail, label: "Email", isSecure: false, errorMessage: "Email is not valid",inputTitle: "Enter your Email")
    
    @StateObject private var passwordViewModel = ValidatedTextFieldViewModel(validationRule: isValidPassword, label: "Password", isSecure: true, errorMessage: "Password is not valid",inputTitle: "Enter your Password")
    
    @EnvironmentObject private var loginManager: LoginManager
    
    var body: some View {
        VStack {
            ValidatedTextField(
                viewModel: emailViewModel
            )
            
            ValidatedTextField(
                viewModel: passwordViewModel
            )
            
            SwitchItem(isOn: $isSaveUserEnabled, label: "Remember me")
            
            CustomButton(label: "Sign In", action: {
                withAnimation {
                    loginManager.signIn(signInType: .regular, username: username, password: password)
                }
            })
            .padding(.vertical, 20)
            .disabled(loginManager.isLoading)
            
            if loginManager.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color("AccentColor"))) // Change color to blue
                    .scaleEffect(1.5)
                    .padding()
            }
            
            Spacer()
            
            Text("Or you can sign in with:")
            
            GoogleSignInButton()
                .padding()
                .onTapGesture {
                    loginManager.signIn(signInType: .google, username: username, password: password)
                }
            
            
        }
        .navigationBarTitle("Sign In", displayMode: .large)
        .padding(28)
        .background(Color("Background"))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


//
//  LoginManager.swift
//  ToDoSwift
//
//  Created by Ezequiel Perez on 08/08/2023.
//

import Foundation

enum SignInType: String {
    case google
    case facebook
    case regular
    case unknown
}

class LoginManager: ObservableObject {
    @Published var isLoggedIn = false
    @Published var isLoading = false
    @Published var loginError = false
    
    private var regularAuthViewModel: RegularAuthViewModel
    private var googleAuthViewModel: GoogleAuthViewModel
    
    init(regularAuthViewModel: RegularAuthViewModel, googleAuthViewModel: GoogleAuthViewModel) {
        self.regularAuthViewModel = regularAuthViewModel
        self.googleAuthViewModel = googleAuthViewModel
    }
    
    static func setLoginType(_ type: SignInType) {
        UserDefaultsManager.set(type.rawValue, forKey: .signInType)
    }
    

    
    func getLoginType() -> SignInType {
        if let signInTypeString: String = UserDefaultsManager.get(forKey: .signInType),
           let signInType = SignInType(rawValue: signInTypeString) {
            return signInType
            
        } else {
            return SignInType.unknown
        }
    }
    
    func checkUserSession() {
        if (self.getLoginType() != .unknown) {
            self.isLoading = true
            if (self.getLoginType() == .google) {
                return googleAuthViewModel.checkPreviousSignIn {
                    self.isLoading = false
                }
            }
            
            if (self.getLoginType() == .regular) {
                return regularAuthViewModel.checkPreviousSignIn {
                    self.isLoading = false
                }
            }
        }
    }
    
    func setSignInSuccess(signInType: SignInType) {
        self.isLoading = false
        LoginManager.setLoginType(signInType)
    }
    
    func setSignOutSuccess() {
        self.isLoading = false
        LoginManager.setLoginType(.unknown)
    }
    
    func signIn(signInType: SignInType, username: String, password: String) {
        isLoading = true
        
        if signInType == .regular {
            regularAuthViewModel.signIn(username: username, password: password) {
                self.setSignInSuccess(signInType: .regular)
            }
        } else if signInType == .google {
            googleAuthViewModel.signIn {
                self.setSignInSuccess(signInType: .google)
            }
        }
    }
    
    func signOut() {
        isLoading = true
        
        if self.getLoginType() == .regular {
            regularAuthViewModel.signOut {
                self.setSignOutSuccess()
            }
        } else if self.getLoginType() == .google {
            googleAuthViewModel.signOut {
                self.setSignOutSuccess()
            }
        }
    }
}

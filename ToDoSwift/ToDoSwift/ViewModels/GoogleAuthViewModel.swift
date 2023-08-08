//
//  GoogleAuthViewModel.swift
//  ToDoSwift
//
//  Created by Ezequiel Perez on 07/08/2023.
//

import Firebase
import GoogleSignIn

class GoogleAuthViewModel: ObservableObject {
    private func authenticateUser(for user: GIDGoogleUser?, with error: Error?, completion: @escaping () -> Void) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        guard let user = user else {
            print("User object is nil")
            return
        }
        
        guard let idToken = user.idToken?.tokenString else {
            print("idToken is nil")
            return
        }
        
        
        let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
        
        Auth.auth().signIn(with: credential) { (_, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                completion()
            }
        }
    }
    
    func signIn(completion: @escaping () -> Void) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        guard let rootViewController = windowScene.windows.first?.rootViewController else { return }
        
        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { [unowned self] result, error in
            authenticateUser(for: result?.user, with: error, completion: completion)
        }
    }
    
    func signOut(completion: @escaping () -> Void) {
        GIDSignIn.sharedInstance.signOut()
        
        do {
            try Auth.auth().signOut()
            
            completion()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func checkPreviousSignIn(completion: @escaping () -> Void) {
        if GIDSignIn.sharedInstance.hasPreviousSignIn() {
            GIDSignIn.sharedInstance.restorePreviousSignIn { [unowned self] user, error in
                authenticateUser(for: user, with: error, completion: completion)
            }
        } else {
            signIn(completion: completion)
        }
    }
}

//
//  RegularAuthViewModel.swift
//  ToDoSwift
//
//  Created by Ezequiel Perez on 08/08/2023.
//

import Foundation

class RegularAuthViewModel: ObservableObject {
    var mockLoginValid = true
    
    func signIn(username: String, password: String, completion: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [self] in
            if mockLoginValid {
                completion()
            } else {
            }
        }
    }
    
    func signOut(completion: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [self] in
            if mockLoginValid {
                completion()
            } else {
            }
        }
    }
    
    func checkPreviousSignIn(completion: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [self] in
            if mockLoginValid {
                completion()
            } else {
            }
        }
    }
}

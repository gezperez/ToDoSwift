//
//  SessionManager.swift
//  ToDoSwift
//
//  Created by Ezequiel Perez on 31/07/2023.
//

import Foundation

class SessionManager: ObservableObject {
    private static let isLoggedInKey = "isLoggedIn"

    static var isLoggedIn: Bool {
        get {
            return UserDefaults.standard.bool(forKey: isLoggedInKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: isLoggedInKey)
        }
    }
}

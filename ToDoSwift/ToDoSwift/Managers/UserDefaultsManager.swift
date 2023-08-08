//
//  UserDefaultsManager.swift
//  ToDoSwift
//
//  Created by Ezequiel Perez on 08/08/2023.
//

import Foundation

enum UserDefaultsKeys: String {
    case signInType
}

class UserDefaultsManager {
    static func set<T>(_ value: T?, forKey key: UserDefaultsKeys) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    static func get<T>(forKey key: UserDefaultsKeys) -> T? {
        return UserDefaults.standard.value(forKey: key.rawValue) as? T
    }
    
    static func remove(forKey key: UserDefaultsKeys) {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
    }
}

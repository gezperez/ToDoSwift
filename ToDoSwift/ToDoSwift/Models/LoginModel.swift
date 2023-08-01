//
//  LoginModel.swift
//  ToDoSwift
//
//  Created by Ezequiel Perez on 31/07/2023.
//

import Foundation

struct LoginResponse: Decodable {
    let success: Bool
    let message: String?
    let authToken: String?
    let userID: String?

    // Additional properties specific to your login response
}

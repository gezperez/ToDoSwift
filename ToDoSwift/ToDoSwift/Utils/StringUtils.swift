//
//  StringUtils.swift
//  ToDoSwift
//
//  Created by Ezequiel Perez on 01/08/2023.
//

import Foundation

import Foundation

func isValidEmail(_ email: String) -> Bool {
    // Regular expression pattern for email validation
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"

    let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
    return emailPredicate.evaluate(with: email)
}

func isValidPassword(_ password: String) -> Bool {
    // Define the password strength rules
    let minLength = 8
    let containsUppercaseLetter = NSPredicate(format: "SELF MATCHES %@", ".*[A-Z]+.*")
    let containsLowercaseLetter = NSPredicate(format: "SELF MATCHES %@", ".*[a-z]+.*")
    let containsDigit = NSPredicate(format: "SELF MATCHES %@", ".*\\d+.*")

    // Create a compound predicate with AND operator to combine the rules
    let compoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [
        containsUppercaseLetter,
        containsLowercaseLetter,
        containsDigit
    ])

    // Check the password against the rules
    return password.count >= minLength && compoundPredicate.evaluate(with: password)
}










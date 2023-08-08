//
//  ValidatedTextFieldViewModel.swift
//  ToDoSwift
//
//  Created by Ezequiel Perez on 01/08/2023.
//

import Foundation

class ValidatedTextFieldViewModel: ObservableObject {
    @Published var text = ""
    @Published var isValid = true
    
    @Published var validationRule: (String) -> Bool
    @Published var label: String
    @Published var isSecure: Bool
    @Published var errorMessage: String
    @Published var inputTitle: String
    
    init(
        validationRule: @escaping (String) -> Bool,
        label: String,
        isSecure: Bool,
        errorMessage: String,
        inputTitle: String
    ) {
        self.validationRule = validationRule
        self.label = label
        self.isSecure = isSecure
        self.errorMessage = errorMessage
        self.inputTitle = inputTitle
    }
    
    func validate() {
        guard !text.isEmpty else {
            return isValid = true
        }
        
        isValid = validationRule(text)
    }
    
    func resetValidation() {
        isValid = true
    }
}

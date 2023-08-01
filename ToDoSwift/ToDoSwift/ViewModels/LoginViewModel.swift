//
//  LoginViewModel.swift
//  ToDoSwift
//
//  Created by Ezequiel Perez on 31/07/2023.
//

import SwiftUI
import Combine

class LoginViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
    
    @Published var data: [LoginResponse] = []
    @Published var loading = false
    private var cancellables = Set<AnyCancellable>()
    
    func handleLogin() -> Bool {
        // Dummy session validation. Replace these with your actual validation logic.
        let validUsername = "user"
        let validPassword = "password"
        
        return username == validUsername && password == validPassword
    }
    
    //    func handleLogin() {
    //        // Dummy session validation. Replace these with your actual validation logic.
    //        let validUsername = "user"
    //        let validPassword = "password"
    //
    //            guard let url = URL(string: "https://your-api-url.com/data") else { return }
    //
    //            loading = true // Set loading state to true
    //
    //            URLSession.shared.dataTaskPublisher(for: url)
    //                .map(\.data)
    //                .decode(type: [LoginResponse].self, decoder: JSONDecoder())
    //                .receive(on: DispatchQueue.main)
    //                .sink(receiveCompletion: { [weak self] completion in
    //                    self?.loading = false // Set loading state to false on completion
    //
    //                    switch completion {
    //                    case .finished:
    //                        break
    //                    case .failure(let error):
    //                        print("API Error: \(error)")
    //                    }
    //                }, receiveValue: { [weak self] result in
    //                    self?.data = result
    //                })
    //                .store(in: &cancellables)
    //        }
}

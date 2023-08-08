//
//  TaskService.swift
//  ToDoSwift
//
//  Created by Ezequiel Perez on 01/08/2023.
//

import Foundation
import Combine

class TaskService {
    @Published var isLoading = false
    
    let categories: [Category] = [
        Category(id: UUID(), name: "Shopping"),
        Category(id: UUID(), name: "Household"),
        Category(id: UUID(), name: "Hobby")
    ]
    
    
    func getTasks() -> AnyPublisher<[Task], Error> {
        isLoading = true
        
        // Simulate an asynchronous API call using Combine's Just publisher
        let tasks: [Task] = [
            Task(id: UUID(), title: "Buy groceries", category: categories.first!, isCompleted: false),
            Task(id: UUID(), title: "Do laundry", category: categories.first!, isCompleted: false)
        ]
        
        return Just(tasks)
            .setFailureType(to: Error.self)
            .delay(for: .seconds(1), scheduler: DispatchQueue.main) // Simulate a delay
            .handleEvents(receiveCompletion: { [weak self] _ in
                self?.isLoading = false // Set isLoading to false when the API call completes
            })
            .eraseToAnyPublisher()
    }
}

//
//  TaskViewModel.swift
//  ToDoSwift
//
//  Created by Ezequiel Perez on 30/07/2023.
//

import Foundation
import Combine

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = [] {
            didSet {
                objectWillChange.send()
            }
        }

    let objectWillChange = PassthroughSubject<Void, Never>()
    
    private let tasksKey = "storedTasks"
    
    init() {
        // Load tasks from UserDefaults on initialization
        loadTasks()
    }
    
    // Method to add a new task
    func addTask(id: UUID, title: String, category: Category?) {
        let newTask = Task(id: id, title: title, category: category, isCompleted: false)
        tasks.append(newTask)
        saveTasks()
    }
    
    // Method to mark a task as completed
    func markAsCompleted(task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
            saveTasks()
        }
    }
    
    // Method to remove a task using its id
    func removeTask(taskID: UUID) {
        if let index = tasks.firstIndex(where: { $0.id == taskID }) {
            tasks.remove(at: index)
            saveTasks()
        }
    }
    
    // Save tasks to UserDefaults
    private func saveTasks() {
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(tasks) {
            UserDefaults.standard.set(encodedData, forKey: tasksKey)
        }
    }
    
    // Load tasks from UserDefaults
    private func loadTasks() {
        if let data = UserDefaults.standard.data(forKey: tasksKey) {
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([Task].self, from: data) {
                tasks = decodedData
            }
        }
    }
}

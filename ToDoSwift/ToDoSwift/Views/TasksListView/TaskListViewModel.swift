//
//  TaskViewModel.swift
//  ToDoSwift
//
//  Created by Ezequiel Perez on 30/07/2023.
//

import Foundation
import Combine

class TaskListViewModel: ObservableObject {
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    @Published var tasks: [Task] = [] {
        didSet {
            objectWillChange.send()
            filterTasks()
        }
    }
    
    @Published private(set) var filteredTasks: [Task] = []
    
    @Published var searchText = "" {
        didSet {
            objectWillChange.send()
            filterTasks()
        }
    }
    
    private var taskService = TaskService()
    private var cancellables: Set<AnyCancellable> = []
    
    var isLoading: Bool {
            taskService.isLoading
        }

    private let tasksKey = "storedTasks"
    
    private func filterTasks() {
        if searchText.isEmpty {
            filteredTasks = tasks
        } else {
            filteredTasks = tasks.filter { task in
                // Filter tasks based on the search text (e.g., by title or category)
                return task.title.localizedCaseInsensitiveContains(searchText) || task.category.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    init() {
        // Load tasks from UserDefaults on initialization
        fetchTasks()
    }
    
    // Method to fetch the tasks from the TaskService
    func fetchTasks() {
        taskService.getTasks()
            .sink(receiveCompletion: { completion in
                if case let .failure(error) = completion {
                    print("Error fetching tasks: \(error)")
                }
            }, receiveValue: { [weak self] tasks in
                self?.tasks = tasks
            })
            .store(in: &cancellables)
    }
    
    
    // Method to add a new task
    func addTask(id: UUID, title: String, category: Category) {
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

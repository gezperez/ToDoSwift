//
//  AddTaskViewModel.swift
//  ToDoSwift
//
//  Created by Ezequiel Perez on 30/07/2023.
//

import Foundation

class AddTaskViewModel: ObservableObject {
    @Published var taskName = ""
    @Published var selectedCategoryIndex = 0
    var categoryViewModel: CategoryViewModel
    
    init(categoryViewModel: CategoryViewModel) {
            self.categoryViewModel = categoryViewModel
        }
    
    var selectedCategory: Category? {
            return categoryViewModel.categories.indices.contains(selectedCategoryIndex) ? categoryViewModel.categories[selectedCategoryIndex] : nil
        }
    
    func addTask(taskViewModel: TaskViewModel) {
        guard !taskName.isEmpty else { return }
        let category = selectedCategory ?? categoryViewModel.categories.first
        let newTaskID = UUID()
        taskViewModel.addTask(id: newTaskID, title: taskName, category: category)
    }
    
    func setSelectedCategory(index: Int) {
            selectedCategoryIndex = index
        }
}

//
//  CategoryViewModel.swift
//  ToDoSwift
//
//  Created by Ezequiel Perez on 31/07/2023.
//

import Combine

class CategoryViewModel: ObservableObject {
    @Published var categories: [Category]

    init() {
        // Initialize with some sample categories (you can load categories from data persistence here)
        let category1 = Category(name: "Personal")
        let category2 = Category(name: "Work")

        categories = [category1, category2]
    }

    // Method to add a new category
    func addCategory(name: String) {
        let newCategory = Category(name: name)
        categories.append(newCategory)
    }
}

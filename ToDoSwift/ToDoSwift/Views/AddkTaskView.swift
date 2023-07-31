//
//  AddkTaskView.swift
//  ToDoSwift
//
//  Created by Ezequiel Perez on 30/07/2023.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.presentationMode) private var presentationMode
    @ObservedObject var addTaskViewModel: AddTaskViewModel
    @EnvironmentObject private var taskViewModel: TaskViewModel
    @StateObject private var categoryViewModel = CategoryViewModel()
    
    init() {
            let categoryViewModel = CategoryViewModel() // Initialize CategoryViewModel here
            self.addTaskViewModel = AddTaskViewModel(categoryViewModel: categoryViewModel) // Pass categoryViewModel
        }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Task Name")) {
                    TextField("Enter task name", text: $addTaskViewModel.taskName)
                }
                Section(header: Text("Category")) {
                    Picker("Select Category", selection: $addTaskViewModel.selectedCategoryIndex) {
                        ForEach(0..<addTaskViewModel.categoryViewModel.categories.count) { index in
                            Text(addTaskViewModel.categoryViewModel.categories[index].name).tag(index)
                        }
                    }
                    .onChange(of: addTaskViewModel.selectedCategoryIndex) { index in
                        addTaskViewModel.setSelectedCategory(index: index)
                    }
                }
            }
            .navigationBarTitle("Add Task", displayMode: .inline)
            .navigationBarItems(trailing: Button("Add") {
                addTaskViewModel.addTask(taskViewModel: taskViewModel)
                addTaskViewModel.objectWillChange.send() 
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

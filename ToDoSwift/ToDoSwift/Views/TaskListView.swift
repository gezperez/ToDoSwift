//
//  TaskListView.swift
//  ToDoSwift
//
//  Created by Ezequiel Perez on 30/07/2023.
//

import SwiftUI

struct TaskListView: View {
    @StateObject private var taskViewModel = TaskViewModel()
    @EnvironmentObject private var loginViewModel: LoginViewModel
    @State private var isAddTaskViewPresented = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(taskViewModel.tasks) { task in
                        HStack {
                            Text(task.title)
                                .foregroundColor(task.isCompleted ? .gray : .black)
                                .strikethrough(task.isCompleted)
                                .onTapGesture {
                                    taskViewModel.markAsCompleted(task: task)
                                }
                            
                            Spacer()
                            
                            if task.isCompleted {
                                Button("Delete") {
                                    taskViewModel.removeTask(taskID: task.id)
                                }
                                .foregroundColor(.red)
                            }
                        }
                    }
                    
                }
                Button("Logout") {
                                loginViewModel.logout() // Trigger the logout function
                            }
                            .padding()
            }
            .navigationBarTitle("Todo List")
            .navigationBarItems(trailing: Button(action: {
                isAddTaskViewPresented = true
            }) {
                Image(systemName: "plus")
            })
        }
        .sheet(isPresented: $isAddTaskViewPresented) {
            AddTaskView().environmentObject(taskViewModel)
        }
    }
}


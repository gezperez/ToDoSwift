//
//  TaskListView.swift
//  ToDoSwift
//
//  Created by Ezequiel Perez on 30/07/2023.
//

import SwiftUI

struct TaskListView: View {
    @EnvironmentObject private var taskViewModel: TaskListViewModel
    @EnvironmentObject private var loginManager: LoginManager
    @State private var isAddTaskViewPresented = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                if (taskViewModel.isLoading) {
                    ProgressView("Loading Tasks...")
                } else {
                    List {
                        ForEach(taskViewModel.filteredTasks) { task in
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
                }
                TextField("Search task", text: $taskViewModel.searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("Logout") {
                    loginManager.signOut()
                }
                .padding()
            }
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

struct TaskList_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
            .environmentObject(TaskListViewModel())
    }
}


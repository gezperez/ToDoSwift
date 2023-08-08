//
//  ToDoSwiftApp.swift
//  ToDoSwift
//
//  Created by Ezequiel Perez on 30/07/2023.
//

import SwiftUI
import Firebase

@main
struct ToDoSwiftApp: App {
    @StateObject private var taskListViewModel = TaskListViewModel()
    @StateObject private var loginManager: LoginManager = LoginManager(
            regularAuthViewModel: RegularAuthViewModel(),
            googleAuthViewModel: GoogleAuthViewModel()
        )
    
    init() {
        setupAuthentication()
      }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(loginManager)
                .environmentObject(taskListViewModel)
        }
    }
}

extension ToDoSwiftApp {
  private func setupAuthentication() {
    FirebaseApp.configure()
  }
}

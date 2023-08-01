//
//  ContentView.swift
//  ToDoSwift
//
//  Created by Ezequiel Perez on 31/07/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoggedIn = SessionManager.isLoggedIn

    var body: some View {
        if isLoggedIn {
            // Show Todo List when logged in
            TaskListView(isLoggedIn: $isLoggedIn)
        } else {
            // Show Login View when not logged in
            LoginView(isLoggedIn: $isLoggedIn)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

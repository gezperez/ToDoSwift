//
//  ContentView.swift
//  ToDoSwift
//
//  Created by Ezequiel Perez on 31/07/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var loginViewModel: LoginViewModel

    var body: some View {
        NavigationView {
            if loginViewModel.isLoggedIn {
                TaskListView()
            } else {
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

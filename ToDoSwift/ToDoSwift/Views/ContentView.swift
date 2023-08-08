//
//  ContentView.swift
//  ToDoSwift
//
//  Created by Ezequiel Perez on 31/07/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var loginManager: LoginManager
    
    var body: some View {
        NavigationView {
            if (loginManager.getLoginType() != .unknown) {
                TaskListView()
            } else {
                LoginView()
            }
        }
        .onAppear {
            loginManager.checkUserSession()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  BackButton.swift
//  ToDoSwift
//
//  Created by Ezequiel Perez on 06/08/2023.
//

import SwiftUI

struct BackButtonView: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.left")
                .foregroundColor(.accentColor)
                .imageScale(.large)
                .frame(width: 44, height: 44)
        }
    }
}

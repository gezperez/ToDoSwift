//
//  SearchBar.swift
//  ToDoSwift
//
//  Created by Ezequiel Perez on 01/08/2023.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("Search", text: $text)
        }
        .padding(8)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(8)
    }
}

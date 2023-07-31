//
//  CategoryModel.swift
//  ToDoSwift
//
//  Created by Ezequiel Perez on 30/07/2023.
//

import Foundation

struct Category: Identifiable, Hashable, Codable {
    var id = UUID()
    var name: String
}

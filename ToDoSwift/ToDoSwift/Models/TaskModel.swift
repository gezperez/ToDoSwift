//
//  TaskModel.swift
//  ToDoSwift
//
//  Created by Ezequiel Perez on 30/07/2023.
//

import Foundation

struct Task: Identifiable, Codable {
    let id: UUID
    var title: String
    var category: Category?
    var isCompleted: Bool
}

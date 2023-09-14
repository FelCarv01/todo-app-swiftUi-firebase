//
//  ToDoModel.swift
//  TodoList
//
//  Created by Felipe Carvalho on 27/08/23.
//

import Foundation

struct TodoModel: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    //should use mutating in a struct
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}

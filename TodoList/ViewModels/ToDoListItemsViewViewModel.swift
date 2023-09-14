//
//  ToDoListItemsViewViewModel.swift
//  TodoList
//
//  Created by Felipe Carvalho on 27/08/23.
//

import Foundation

class TodoListItemsViewViewModel: ObservableObject {
    @Published var showingNewItemView: Bool = false
    
    init() {}
    
    func delete(id: String) {
        
    }
}

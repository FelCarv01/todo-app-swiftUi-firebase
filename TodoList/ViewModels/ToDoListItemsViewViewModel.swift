//
//  ToDoListItemsViewViewModel.swift
//  TodoList
//
//  Created by Felipe Carvalho on 27/08/23.
//

import Foundation
import FirebaseFirestore

class TodoListItemsViewViewModel: ObservableObject {
    @Published var showingNewItemView: Bool = false
    
    private let userId: String
    init(userId: String) {
        self.userId = userId
    }
    
    /// Delete Todo item
    /// - Parameter id: Todo id to delete
    func delete(id: String) {
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}

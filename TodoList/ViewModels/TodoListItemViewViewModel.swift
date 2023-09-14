//
//  TodoListItemViewViewModel.swift
//  TodoList
//
//  Created by Felipe Carvalho on 27/08/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class TodoListItemViewViewModel: ObservableObject {
    
    init() {}
    
    func isDoneToggle(item: TodoModel) {
        // change de copy of structs
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uId = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
        
    }
}

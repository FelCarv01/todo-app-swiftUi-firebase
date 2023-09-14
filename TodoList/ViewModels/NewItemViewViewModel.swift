//
//  NewItemViewViewModel.swift
//  TodoList
//
//  Created by Felipe Carvalho on 27/08/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var errorMessage = ""
    @Published var dueDate = Date()
    
    init() {}
    
    func save() {
        guard canSave else {
            return
        }
        // get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // create model
        let newId = UUID().uuidString
        let newItem = TodoModel(
            id: newId,
            title: title,
            dueDate: Date().timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        
        // save model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
        
    }
    
    var canSave: Bool {
        errorMessage = ""
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "O título não pode ser vazio"
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            errorMessage = "Data inválida"
            return false
        }
        
        return true
    }
}

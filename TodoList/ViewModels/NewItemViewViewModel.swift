//
//  NewItemViewViewModel.swift
//  TodoList
//
//  Created by Felipe Carvalho on 27/08/23.
//

import Foundation

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var errorMessage = ""
    @Published var dueDate = Date()
    
    init() {}
    
    func save() {
        
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

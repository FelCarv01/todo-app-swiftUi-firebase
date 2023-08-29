//
//  RegisterViewViewModel.swift
//  TodoList
//
//  Created by Felipe Carvalho on 27/08/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


class RegisterViewViewModel:  ObservableObject{
    @Published var userName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init()  {}
    
    func register() {
        guard validate() else {
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String) {
        let newUser = UserModel(id: id, userName: userName, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !userName.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            errorMessage = "Preencha todos os campos"
            return false
        }
        
       
        guard email.isValidEmail else {
            errorMessage = "Email Inválido"
            return false
        }
        
        guard password.count >= 6 else {
            errorMessage = "Senha deve ter no mínimo 6 caracteres"
            return false
        }
        return true
    }
    
}

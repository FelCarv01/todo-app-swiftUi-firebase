//
//  LoginViewViewModel.swift
//  TodoList
//
//  Created by Felipe Carvalho on 27/08/23.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init()  {}
    
     func login() {
         guard validate() else {
             return
         }
         
         // try login
         Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Preencha todos os campos"
            return false
        }
        let regex = "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$"
        guard email.contains(regex) else {
            errorMessage = "Email Inválido"
            return false
        }
        return true
    }
    
}

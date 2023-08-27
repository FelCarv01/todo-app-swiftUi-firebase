//
//  RegisterView.swift
//  TodoList
//
//  Created by Felipe Carvalho on 27/08/23.
//

import SwiftUI

struct RegisterView: View {
    @State var email = ""
    @State var userName = ""
    @State var password = ""
    
    var body: some View {
        VStack{
            HeaderView(title: "Cadastrar",
                       subTitle: "Inicie a organização",
                       angle: -15,
                       backgroundColor: .green)
            
            
            Form {
                TextField("Nome", text: $userName)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .padding(.vertical, 8)
                
                TextField("Email", text: $email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                    .padding(.vertical, 8)

                SecureField("Senha", text: $password)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .padding(.vertical, 8)
                    
                TLButton(title: "Cadastrar", backgroundColor: .green) {
                    // to register
                }.padding()
            }
            .offset(y: -50)
            
            Spacer()
            
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}


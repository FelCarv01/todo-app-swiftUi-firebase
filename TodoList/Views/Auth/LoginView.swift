//
//  LoginView.swift
//  TodoList
//
//  Created by Felipe Carvalho on 27/08/23.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "To Do List", subTitle: "Deixe tudo pronto!", angle: 15, backgroundColor: .blue)
                
                // Login Form
                
                Form {
                    TextField("Email", text: $email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                        .padding(.vertical, 8)

                    SecureField("Senha", text: $password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .padding(.vertical, 8)
                        
                    TLButton(title: "Entrar", backgroundColor: .blue) {
                        // to login
                    }.padding()
                }
                .offset(y: -50)
                
                // Resgister Link
                
                VStack{
                    Text("Novo por Aqui?")
                    NavigationLink("Cadastre-se", destination: RegisterView())
                    
                }
                .padding(.bottom, 50)
                
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}



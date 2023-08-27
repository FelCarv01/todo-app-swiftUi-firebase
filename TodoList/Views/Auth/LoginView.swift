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
              HeaderView()
                
                // Login Form
                
                Form {
                    TextField("Email", text: $email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .padding(.vertical, 8)

                    TextField("Senha", text: $password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .padding(.vertical, 8)
                        
                    Button{
                        // to login
                    }label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.blue)
                                
                            
                            Text("Entrar")
                                .foregroundColor(.white)
                                .bold()
                        }
                    }.padding()
                }
                
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



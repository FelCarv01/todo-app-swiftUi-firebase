//
//  LoginView.swift
//  TodoList
//
//  Created by Felipe Carvalho on 27/08/23.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    @State private var isAnimated = false
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "To Do List", subTitle: "Deixe tudo pronto!", angle: 15, backgroundColor: .blue)
                
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                        .padding(.vertical, 8)
                    
                    SecureField("Senha", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .padding(.vertical, 8)
                    
                    TLButton(title: "Entrar", backgroundColor: .blue) { viewModel.login() }
                        .padding()
                }
                .offset(y: -50)
                
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



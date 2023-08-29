//
//  RegisterView.swift
//  TodoList
//
//  Created by Felipe Carvalho on 27/08/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel =  RegisterViewViewModel()
    
    var body: some View {
        VStack{
            HeaderView(title: "Cadastrar",
                       subTitle: "Inicie a organização",
                       angle: -15,
                       backgroundColor: .green)
            
            
            Form {
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(Color.red)
                }
                TextField("Nome", text: $viewModel.userName)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .padding(.vertical, 8)
                
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                    .padding(.vertical, 8)
                
                SecureField("Senha", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .padding(.vertical, 8)
                
                TLButton(title: "Cadastrar", backgroundColor: .green) {
                    viewModel.register()
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


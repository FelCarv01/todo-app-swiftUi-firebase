//
//  ProfileView.swift
//  TodoList
//
//  Created by Felipe Carvalho on 27/08/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                if let user = viewModel.user {
                    profile(user: user)
                    
                } else {
                    Text("Carregando o perfil . . . ")
                }
            }.navigationTitle("Perfil")
            
        }.onAppear{
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: UserModel) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 125).padding()
        
        VStack(alignment: .leading) {
            HStack {
                Text("Nome: ").bold()
                Text(user.userName)
            }
            .padding()
            HStack {
                Text("Email: ").bold()
                Text(user.email)
            }
            .padding()
            HStack {
                Text("Membro desde: ").bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
        }
        
        Spacer()
        
        TLButton(title: "Sair", backgroundColor: Color.pink) {
            viewModel.logOut()
        }.frame(maxWidth: 140, maxHeight: 56)
        
        Spacer()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

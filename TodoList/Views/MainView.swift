//
//  ContentView.swift
//  TodoList

//  Created by Felipe Carvalho on 27/08/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            TabView{
                ToDoListItemsView()
                    .tabItem{Label("Home", systemImage: "house")}
                
                ProfileView()
                    .tabItem{Label("Perfil", systemImage: "person.circle")}
            }
            
        }else {
            LoginView()

        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

//
//  ToDoListItems.swift
//  TodoList
//
//  Created by Felipe Carvalho on 27/08/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListItemsView: View {
    @StateObject var viewModel: TodoListItemsViewViewModel
    @FirestoreQuery var items: [TodoModel]
    
    init(userId: String) {
        self._items = FirestoreQuery(
        collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(
            wrappedValue: TodoListItemsViewViewModel(
                userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack{
                List(items) {item in
                    ToDoListItemView(item: item)
                        .swipeActions{
                            Button ("Deletar"){
                                viewModel.delete(id: item.id)
                            }
                            .tint(Color.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                }label: {
                    Image(systemName: "plus")
                }
            }.sheet(isPresented: $viewModel.showingNewItemView){
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct ToDoListItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemsView(userId: "25ITb12sbJQNk3GO7s5KFg3cLOl2")
    }
}

//
//  ToDoListItemView.swift
//  TodoList
//
//  Created by Felipe Carvalho on 27/08/23.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = TodoListItemViewViewModel()
    let item: TodoModel
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.title)
                
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            
            Button {
                viewModel.isDoneToggle(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.square.fill" : "square")
            }
        }
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(item: .init(
            id:"123",
            title: "Prova",
            dueDate: Date().timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false))
    }
}

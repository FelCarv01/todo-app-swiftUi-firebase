//
//  NewItemView.swift
//  TodoList
//
//  Created by Felipe Carvalho on 27/08/23.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack{
            Text("Novo Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            Form {
            
                Text(viewModel.errorMessage).foregroundColor(.red)
                //Title
                TextField("Título", text: $viewModel.title)
                //Due Date
                DatePicker("Data da entrega", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                //Button
                TLButton(title: "Salvar", backgroundColor: .green){
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    }
                   
                }
                .padding()
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}

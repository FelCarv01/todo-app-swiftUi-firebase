//
//  SplashView.swift
//  TodoList
//
//  Created by Felipe Carvalho on 30/08/23.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            MainView()
        }else {
            VStack{
                VStack(){
                    Image(systemName: "checkmark.square.fill")
                        .font(.system(size: 80))
                        .foregroundColor(.green)
                    Text("ToDo List")
                        .font(.system(size: 26,weight: .bold))
                        .foregroundColor(.black.opacity(0.8))
                }.scaleEffect(size).opacity(opacity).onAppear{
                    withAnimation(.easeInOut(duration: 0.8)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    withAnimation{
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}

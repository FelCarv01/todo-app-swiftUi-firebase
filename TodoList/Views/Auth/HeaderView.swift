//
//  HeaderView.swift
//  TodoList
//
//  Created by Felipe Carvalho on 27/08/23.
//

import SwiftUI


struct HeaderView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(.blue)
                .rotationEffect(Angle.degrees(15))
            
            VStack{
                Text("To Do List")
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .bold()
                Text("Deixe tudo pronto!")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
            }
            .padding(.top, 40)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 300)
        .offset(y:-100 )
    }
}


struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}

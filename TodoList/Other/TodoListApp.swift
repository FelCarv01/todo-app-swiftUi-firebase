//
//  TodoListApp.swift
//  TodoList
//
//  Created by Felipe Carvalho on 27/08/23.
//

import FirebaseCore
import SwiftUI

@main
struct TodoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            SplashView()
        }
    }
}

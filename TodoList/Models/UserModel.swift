//
//  UserModel.swift
//  TodoList
//
//  Created by Felipe Carvalho on 27/08/23.
//

import Foundation

struct UserModel: Codable {
    let id: String
    let userName: String
    let email: String
    let joined: TimeInterval
}

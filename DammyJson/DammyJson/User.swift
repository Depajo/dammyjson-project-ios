//
//  User.swift
//  DammyJson
//
//  Created by Joonatan De Pascale on 16.5.2023.
//

import Foundation

struct User: Codable {
    var id: Int
    var firstName: String
    var lastName: String
    var age: Int
    var email: String
    var phone: String
    var username: String
    var password: String
}

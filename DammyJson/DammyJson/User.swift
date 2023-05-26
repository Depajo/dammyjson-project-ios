//
//  User.swift
//  DammyJson
//
//  Created by Joonatan De Pascale on 16.5.2023.
//

import Foundation

/// A Codable structure representing a user.
///
/// Use `User` to represent a user with properties such as
/// ID, first name, last name, age, email, phone number, username, and password.
struct User: Codable {
    /// The ID of the user.
    var id: Int
    /// The first name of the user.
    var firstName: String
    /// The last name of the user.
    var lastName: String
    /// The age of the user.
    var age: Int
    /// The email address of the user.
    var email: String
    /// The phone number of the user.
    var phone: String
    /// The username of the user.
    var username: String
    /// The password of the user.
    var password: String
}

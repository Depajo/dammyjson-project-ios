//
//  Users.swift
//  DammyJson
//
//  Created by Joonatan De Pascale on 16.5.2023.
//

import Foundation

/// A Codable structure representing a collection of users.
///
/// Use `Users` to represent a collection of users, where each user is represented by a `User` object.
struct Users: Codable {
    /// An array of `User` objects.
    var users: [User]
}


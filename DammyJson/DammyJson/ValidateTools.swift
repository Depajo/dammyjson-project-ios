//
//  ValidateTools.swift
//  DammyJson
//
//  Created by Joonatan De Pascale on 23.5.2023.
//

// Used ChatGPT for create good regex

import Foundation

func validateFirstName(_ firstName: String) -> Bool {
    let regex = "^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$"
    let firstNamePredicate = NSPredicate(format: "SELF MATCHES %@", regex)
    return firstNamePredicate.evaluate(with: firstName)
}

func validateLastName(_ lastName: String) -> Bool {
    let regex = "^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$"
    let lastNamePredicate = NSPredicate(format: "SELF MATCHES %@", regex)
    return lastNamePredicate.evaluate(with: lastName)
}

func validatePhoneNumber(_ phoneNumber: String) -> Bool {
    let regex = #"^\+?(\d{1,3})?[-.\s]?\(?\d{3}\)?[-.\s]?\d{3}[-.\s]?\d{4}$"#
    let phoneNumberPredicate = NSPredicate(format: "SELF MATCHES %@", regex)
    return phoneNumberPredicate.evaluate(with: phoneNumber)
}

func validateEmail(_ email: String) -> Bool {
    let regex = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", regex)
    return emailPredicate.evaluate(with: email)
}

func validateAge(_ age: String) -> Bool {
    if let intAge = Int(age) {
        return intAge >= 18 && intAge <= 120
    }
    return false
}

func validateUsername(_ username: String) -> Bool {
    let regex = "^[a-zA-Z0-9]{3,}$"
    let usernamePredicate = NSPredicate(format: "SELF MATCHES %@", regex)
    return usernamePredicate.evaluate(with: username)
}

func validatePassword(_ password: String) -> Bool {
    return password.count >= 8 &&
            password.rangeOfCharacter(from: .uppercaseLetters) != nil &&
            password.rangeOfCharacter(from: .lowercaseLetters) != nil &&
            password.rangeOfCharacter(from: .decimalDigits) != nil
}

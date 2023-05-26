//
//  ValidateTools.swift
//  DammyJson
//
//  Created by Joonatan De Pascale on 23.5.2023.
//

import Foundation

func validateFirstName(_ firstName: String) -> Bool {
    do {
        let regex = try Regex("^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$")
        return firstName.contains(regex) &&
                    firstName.count > 1 &&
                    firstName.count < 25
    } catch {
        print("Caught an error: \(error)")
    }
    
    return false
}

func validateLastName(_ lastName: String) -> Bool {
    do {
        let regex = try Regex("^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$")
        return lastName.contains(regex) &&
                lastName.count > 1 &&
                lastName.count < 25
    } catch {
        print("Caught an error: \(error)")
    }
    return false
}

func validatePhoneNumber(_ phoneNumber: String) -> Bool {
    do {
        let regex = try Regex(#"^\+?(\d{1,3})?[-.\s]?\(?\d{3}\)?[-.\s]?\d{3}[-.\s]?\d{4}$"#)
        return phoneNumber.contains(regex)
    } catch {
        print("Caught an error: \(error)")
    }
    return false
}

func validateEmail(_ email: String) -> Bool {
    do {
        let regex = try Regex("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$")
        return email.contains(regex)
    } catch {
        print("Caught an error: \(error)")
    }
    return false
}

func validateAge(_ age: String) -> Bool {
    if let intAge = Int(age) {
        return intAge > 0 && intAge < 120
    }
    return false
}

func validateUsername(_ username: String) -> Bool {
    do {
        let regex = try Regex("^[a-zA-Z0-9_]{2,25}$")
        return username.contains(regex)
    } catch {
        print("Caught an error: \(error)")
    }
    return false
}

func validatePassword(_ password: String) -> Bool {
    return password.count >= 8 &&
            password.rangeOfCharacter(from: .uppercaseLetters) != nil &&
            password.rangeOfCharacter(from: .lowercaseLetters) != nil &&
            password.rangeOfCharacter(from: .decimalDigits) != nil
}

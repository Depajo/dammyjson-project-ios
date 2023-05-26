//
//  ValidateTools.swift
//  DammyJson
//
//  Created by Joonatan De Pascale on 23.5.2023.
//

import Foundation

/// Validate the first name field.
///
/// Use `validateFirstName` to validate a first name by checking if it meets the following criteria:
/// - Contains only alphabetic characters, spaces, hyphens, apostrophes, commas, and periods
/// - Length is between 2 and 24 characters
///
/// - Parameter firstName: The first name string to validate.
/// - Returns: `true` if the first name is valid, `false` otherwise.
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

/// Validate the last name field.
///
/// Use `validateLastName` to validate a last name by checking if it meets the following criteria:
/// - Contains only alphabetic characters, spaces, hyphens, apostrophes, commas, and periods
/// - Length is between 2 and 24 characters
///
/// - Parameter lastName: The last name string to validate.
/// - Returns: `true` if the last name is valid, `false` otherwise.
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

/// Validate the phone number field.
///
/// Use `validatePhoneNumber` to validate a phone number by checking if it matches the specified regular expression pattern.
///
/// - Parameter phoneNumber: The phone number string to validate.
/// - Returns: `true` if the phone number is valid, `false` otherwise.
func validatePhoneNumber(_ phoneNumber: String) -> Bool {
    do {
        let regex = try Regex(#"^\+?(\d{1,3})?[-.\s]?\(?\d{3}\)?[-.\s]?\d{3}[-.\s]?\d{4}$"#)
        return phoneNumber.contains(regex)
    } catch {
        print("Caught an error: \(error)")
    }
    return false
}

/// Validate the email field.
///
/// Use `validateEmail` to validate an email address by checking if it matches the specified regular expression pattern.
/// - Contains characters before and after "@" symbol
/// - Contains a dot (" . ") after the "@" symbol followed by at least two characters.
///
/// - Parameter email: The email address string to validate.
/// - Returns: `true` if the email address is valid, `false` otherwise.
func validateEmail(_ email: String) -> Bool {
    do {
        let regex = try Regex("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$")
        return email.contains(regex)
    } catch {
        print("Caught an error: \(error)")
    }
    return false
}

/// Validate the age field.
///
/// Use `validateAge` to validate an age value by checking if it is a positive integer between 1 and 119.
///
/// - Parameter age: The age value to validate.
/// - Returns: `true` if the age is valid, `false` otherwise.
func validateAge(_ age: String) -> Bool {
    if let intAge = Int(age) {
        return intAge > 0 && intAge < 120
    }
    return false
}

/// Validate the username field.
///
/// Use `validateUsername` to validate a username by checking if it matches the specified regular expression pattern.
/// - Contains only alphabetic characters, numbers, underscores and it length is between 2 and 25.
///
/// - Parameter username: The username string to validate.
/// - Returns: `true` if the username is valid, `false` otherwise.
func validateUsername(_ username: String) -> Bool {
    do {
        let regex = try Regex("^[a-zA-Z0-9_]{2,25}$")
        return username.contains(regex)
    } catch {
        print("Caught an error: \(error)")
    }
    return false
}

/// Validate the password field.
///
/// Use `validatePassword` to validate a password by checking if it meets the following criteria:
/// - Length is at least 8 characters
/// - Contains at least one uppercase letter, one lowercase letter, and one digit
///
/// - Parameter password: The password string to validate.
/// - Returns: `true` if the password is valid, `false` otherwise.
func validatePassword(_ password: String) -> Bool {
    return password.count >= 8 &&
            password.rangeOfCharacter(from: .uppercaseLetters) != nil &&
            password.rangeOfCharacter(from: .lowercaseLetters) != nil &&
            password.rangeOfCharacter(from: .decimalDigits) != nil
}

/// Validate all input fields.
///
/// Use `validateFields` to validate all input fields by calling the individual validation functions for each field.
///
/// - Parameters:
///   - firstName: The first name string to validate.
///   - lastName: The last name string to validate.
///   - phoneNumber: The phone number string to validate.
///   - email: The email address string to validate.
///   - age: The age value to validate.
///   - username: The username string to validate.
///   - password: The password string to validate.
/// - Returns: `true` if all fields are valid, `false` otherwise.
func validateFields(firstName: String, lastName: String, phoneNumber: String,email:
                    String, age: String, username: String, password: String) -> Bool {
    let isFirstNameValid = validateFirstName(firstName)
    let isLastNameValid = validateLastName(lastName)
    let isPhoneNumberValid = validatePhoneNumber(phoneNumber)
    let isEmailValid = validateEmail(email)
    let isAgeValid = validateAge(age)
    let isUsernameValid = validateUsername(username)
    let isPasswordValid = validatePassword(password)
    
    return isFirstNameValid && isLastNameValid && isPhoneNumberValid &&
        isEmailValid && isAgeValid && isUsernameValid && isPasswordValid
}

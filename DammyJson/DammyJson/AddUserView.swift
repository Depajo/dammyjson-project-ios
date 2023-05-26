//
//  AddUserView.swift
//  DammyJson
//
//  Created by Joonatan De Pascale on 17.5.2023.
//

import SwiftUI
import Alamofire

/// A view component for adding a new user.
///
/// Use `AddUserView` to provide a form for adding a new user with the specified fields such as
/// first name, last name, phone, email, age, username, and password.
struct AddUserView: View {
    /// The color scheme environment variable.
    @Environment(\.colorScheme) var colorScheme
    /// The state variable for the first name.
    @State var firstName: String = ""
    /// The state variable for the last name.
    @State var lastName: String = ""
    /// The state variable for the phone number.
    @State var phone: String = ""
    /// The state variable for the email address.
    @State var email: String = ""
    /// The state variable for the age.
    @State var age: String = ""
    /// The state variable for the username.
    @State var username: String = ""
    /// The state variable for the password.
    @State var password: String = ""
    /// The state variable for error validation.
    @State var errorValidate: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    MyTextField(validation: validateFirstName("\(firstName)"),
                                title: "Firstname", text: $firstName)
                        .keyboardType(.namePhonePad)
                    MyTextField(validation: validateLastName("\(lastName)"),
                                title: "Lastname", text: $lastName)
                        .keyboardType(.namePhonePad)
                    MyTextField(validation: validatePhoneNumber("\(phone)"),
                                title: "Phone", text: $phone)
                        .keyboardType(.phonePad)
                    MyTextField(validation: validateEmail("\(email)"),
                                title: "Email", text: $email)
                        .keyboardType(.emailAddress)
                    MyTextField(validation: validateAge("\(age)"),
                                title: "Age", text: $age)
                        .keyboardType(.numberPad)
                    MyTextField(validation: validateUsername("\(username)"),
                                title: "Username", text: $username)
                    MyTextField(validation: validatePassword("\(password)"),
                                title: "Password", text: $password)

                    Spacer()
                        .navigationTitle("Add user")
                        .navigationBarItems(trailing:
                            
                            DoneButton {
                                addUser(parms: ["firstName": firstName,
                                                 "lastName": lastName,
                                                    "phone": phone,
                                                    "email": email,
                                                     "age": Int(age)!,
                                                 "username": username,
                                                 "password": password]
                                )
                                
                            }.disabled(!validateFields(firstName: firstName,
                                                      lastName: lastName,
                                                      phoneNumber: phone,
                                                      email: email,
                                                      age: age,
                                                      username: username,
                                                      password: password))
                            
                        )
                        
                }
            }
            .background(Color(colorScheme == .dark ? UIColor.black : UIColor.systemGray6))
        }
    }
}

/// Add a new user to  API.
///
/// Use `addUser` to add a new user to the server with the specified parameters.
/// The function sends a POST request to the server using the `postData` method
/// of the `FetchTools` class. The response from the server is printed.
/// The function does not return any value.
///
/// - Parameter parms: The parameters to be sent in the request body.
func addUser(parms: Parameters) {
    let fetch = FetchTools()
    let url = URLComponents(string: "https://dummyjson.com/users/add")!
    
    fetch.postData(url: url, parameters: parms) { res in
        print("\(res)")
    
    }
}


struct AddUserView_Previews: PreviewProvider {
    static var previews: some View {
        AddUserView()
    }
}

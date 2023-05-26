//
//  EditUserView.swift
//  DammyJson
//
//  Created by Joonatan De Pascale on 17.5.2023.
//

import SwiftUI
import Alamofire

/// A view component for editing user information.
///
/// Use `EditUserView` to edit user information such as first name, last name, phone,
///  email, age, username, and password.
struct EditUserView: View {
    /// The user to be edited.
    var user: User?
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
                ScrollView{
                    MyTextField(validation: validateFirstName("\(firstName)"),
                                title: "", text: $firstName)
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
                    
                    DeleteButton(userId: user!.id)
                    Spacer()
                        .navigationTitle("Edit user")
                        .navigationBarItems(trailing:
                            DoneButton {
                                putUser(parms: ["firstName": firstName,
                                                "lastName": lastName,
                                                "phone": phone,
                                                "email": email,
                                                "age": Int(age)!,
                                                "username": username,
                                                "password": password],
                                                userID: user!.id)
                            
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
            .background(Color(colorScheme == .dark ?
                              UIColor.black :
                                UIColor.systemGray6))
            .onAppear() {
                if let u = user {
                    firstName = u.firstName
                    lastName = u.lastName
                    phone = u.phone
                    email = u.email
                    age = "\(u.age)"
                    username = u.username
                    password = u.password
                }
                
            }
        }
    }
}

/// Update user information on API.
///
///  Use `putUser` to update a user on the server with the specified parameters and user ID.
///  The function sends a PUT request to the server using the `putData` method
///  of the `FetchTools` class. The response from the server is printed.
///  The function does not return any value.
///
/// - Parameters:
///   - parms: The parameters to be sent in the request body.
///   - userID: The ID of the user to be updated.
func putUser(parms: Parameters, userID: Int) {
    let fetch = FetchTools()
    let url = URLComponents(string: "https://dummyjson.com/users/\(userID)")!
    
    fetch.putData(url: url, parameters: parms) { res in
        print("\(res)")
    
    }
}

/// A view component for deleting a user.
///
/// Use `DeleteButton` to provide a button for deleting a user. When the button is pressed,
/// it shows an alert to confirm the deletion. Once the deletion is completed, it navigates back to the
/// ContentView.
struct DeleteButton: View {
    /// The presentation mode environment variable.
    @Environment(\.presentationMode) var presentationMode
    /// The state variable for showing the alert.
    @State var showAlert = false
    /// The state variable for tracking if deletion is completed.
    @State var deletionCompleted = false
    /// The ID of the user to be deleted.
    var userId: Int
    
    var body: some View {
        NavigationStack{
            VStack {
                Button("Delete User") {
                    showAlert = true
                }.alert(isPresented: $showAlert) {
                    Alert(title: Text("Do you want delete user?"),
                          primaryButton: .cancel(),
                          secondaryButton: .destructive(Text("Delete")){
                        deletionCompleted = deleteUser(userId: userId)
                    })
                    
                }.foregroundColor(Color.red)
            }
            .navigationDestination(isPresented: $deletionCompleted) {
                ContentView()
            }
            .padding(.vertical, 20)
        }
        
    }
}

/// Delete a user with the specified user ID.
///
/// Use `deleteUser` to delete a user from the server with the specified user ID. The function
/// sends a DELETE request to the server using the `deleteData` method of the `FetchTools` class.
/// If the deletion is successful, it prints a success message. The function returns `true`
/// if the deletion request was sent successfully, and `false` otherwise.
///
/// - Parameter userId: The ID of the user to delete.
/// - Returns: `true` if the deletion request was sent successfully, `false` otherwise.
func deleteUser(userId: Int) -> Bool {
    let fetch = FetchTools()
    
    if let url: URLComponents =
        URLComponents(string: "https://dummyjson.com/users/\(userId)") {
        
        fetch.deleteData(url: url, parameters: ["id": userId]) { success in
            print("Delete \(success)")
        }
        
        return true
        
    } else {
        return false
    }
    
}

struct EditUserView_Previews: PreviewProvider {
    static var previews: some View {
        EditUserView()
    }
}

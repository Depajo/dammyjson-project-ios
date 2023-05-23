//
//  EditUserView.swift
//  DammyJson
//
//  Created by Joonatan De Pascale on 17.5.2023.
//

import SwiftUI
import Alamofire

struct EditUserView: View {
    var user: User?
    @Environment(\.colorScheme) var colorScheme
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var phone: String = ""
    @State var email: String = ""
    @State var age: String = ""
    @State var username: String = ""
    @State var password: String = ""
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
            .background(Color(colorScheme == .dark ? UIColor.black : UIColor.systemGray6))
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

func putUser(parms: Parameters, userID: Int) {
    let fetch = FetchTools()
    let url = URLComponents(string: "https://dummyjson.com/users/\(userID)")!
    
    fetch.putData(url: url, parameters: parms) { res in
        print("\(res)")
    
    }
}

struct DeleteButton: View {
    @Environment(\.presentationMode) var presentationMode
    @State var showAlert = false
    @State var deletatinComplited = false
    var fetch = FetchTools()
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
                        if let url: URLComponents =
                            URLComponents(
                                string: "https://dummyjson.com/users/\(userId)") {
                            fetch.deleteData(url: url,
                                             parameters: ["id": userId]) { success in
                                print("Delete \(success)")
                                deletatinComplited = true
                            }
                        }
                        
                    })
                    
                }.foregroundColor(Color.red)
            }
            .navigationDestination(isPresented: $deletatinComplited) {
                ContentView()
            }
            .padding(.vertical, 20)
        }
        
    }
}

struct EditUserView_Previews: PreviewProvider {
    static var previews: some View {
        EditUserView()
    }
}

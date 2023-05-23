//
//  AddUserView.swift
//  DammyJson
//
//  Created by Joonatan De Pascale on 17.5.2023.
//

import SwiftUI
import Alamofire

struct AddUserView: View {
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
                ScrollView {
                    MyTextField(validation: validateFirstName("\(firstName)"), title: "Firstname", text: $firstName)
                        .keyboardType(.namePhonePad)
                    MyTextField(validation: validateLastName("\(lastName)"), title: "Lastname", text: $lastName)
                        .keyboardType(.namePhonePad)
                    MyTextField(validation: validatePhoneNumber("\(phone)"), title: "Phone", text: $phone)
                        .keyboardType(.phonePad)
                    MyTextField(validation: validateEmail("\(email)"), title: "Email", text: $email)
                        .keyboardType(.emailAddress)
                    MyTextField(validation: validateAge("\(age)"), title: "Age", text: $age)
                        .keyboardType(.numberPad)
                    MyTextField(validation: validateUsername("\(username)"), title: "Username", text: $username)
                    MyTextField(validation: validatePassword("\(password)"), title: "Password", text: $password)

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

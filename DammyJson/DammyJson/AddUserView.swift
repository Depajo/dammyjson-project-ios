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

    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    MyTextField(title: "Firstname", text: $firstName)
                        .keyboardType(.namePhonePad)
                    MyTextField(title: "Lastname", text: $lastName)
                        .keyboardType(.namePhonePad)
                    MyTextField(title: "Phone", text: $phone)
                        .keyboardType(.phonePad)
                    MyTextField(title: "Email", text: $email)
                        .keyboardType(.emailAddress)
                    MyTextField(title: "Age", text: $age)
                        .keyboardType(.numberPad)
                    MyTextField(title: "Username", text: $username)
                    MyTextField(title: "Password", text: $password)

                    Spacer()
                        .navigationTitle("Add user")
                        .navigationBarItems(trailing:
                            DoneButton {
                                print("Lisätty")
                                if let intAge = Int(age) {
                                    addUser(parms: ["firstName": firstName,
                                                     "lastName": lastName,
                                                        "phone": phone,
                                                        "email": email,
                                                         "age": intAge,
                                                     "username": username,
                                                     "password": password])
                                } else {
                                    print("Age is not int")
                                }
                            }
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

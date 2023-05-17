//
//  AddUserView.swift
//  DammyJson
//
//  Created by Joonatan De Pascale on 17.5.2023.
//

import SwiftUI

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
                        .textContentType(.givenName)
                        .keyboardType(.namePhonePad)
                    MyTextField(title: "Lastname", text: $lastName)
                        .textContentType(.givenName)
                        .keyboardType(.namePhonePad)
                    MyTextField(title: "Phone", text: $phone)
                        .textContentType(.telephoneNumber)
                        .keyboardType(.phonePad)
                    MyTextField(title: "Email", text: $email)
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                    MyTextField(title: "Age", text: $age)
                        .keyboardType(.numberPad)
                    MyTextField(title: "Username", text: $username)
                        .textContentType(.username)
                    MyTextField(title: "Password", text: $password)
                        .textContentType(.password)
                    Spacer()
                        .navigationTitle("Add user")
                        .navigationBarItems(trailing:
                            DoneButton {
                                print("Lisätty")
                            }
                        )
                }
            }
            .background(Color(colorScheme == .dark ? UIColor.black : UIColor.systemGray6))
        }
        
    }
}



struct AddUserView_Previews: PreviewProvider {
    static var previews: some View {
        AddUserView()
    }
}

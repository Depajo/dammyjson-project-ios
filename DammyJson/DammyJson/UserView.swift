//
//  UserView.swift
//  DammyJson
//
//  Created by Joonatan De Pascale on 16.5.2023.
//

import SwiftUI

struct UserView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var user: User!
    var body: some View {
        
        if (user != nil) {
            NavigationStack {
                VStack {
                    Spacer()
                    TextAreaWithLabel(label: "Name:", text: "\(user.firstName) \(user.firstName)")
                    TextAreaWithLabel(label: "Phone:", text: "\(user.phone)")
                    TextAreaWithLabel(label: "Email:", text: "\(user.email)")
                    TextAreaWithLabel(label: "Age:", text: "\(user.age)")
                    TextAreaWithLabel(label: "Username:", text: "\(user.username)")
                    TextAreaWithLabel(label: "Password:", text: "\(user.password)")
                        .navigationTitle("User")
                        .navigationBarItems(trailing:
                                NavigationLink(destination: EditUserView(user: user)) {
                                    Text("Edit")
                                }
                             )
                     
                    Spacer()
                }
                .background(Color(colorScheme == .dark ? UIColor.black : UIColor.systemGray6))
            }
        } else {
            ProgressView()
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}

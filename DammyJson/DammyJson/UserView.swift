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
                                 Button (action: {

                                 }) {
                                     Text("Edit")
                                 }
                             )
                    Spacer()
                }
                .background(Color(colorScheme == .dark ? UIColor.black : UIColor.systemGray5))
            }
        } else {
            ProgressView()
        }
        
    }
}

struct TextAreaWithLabel: View {
    @Environment(\.colorScheme) var colorScheme
    
    var label: String
    var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
        
            Text(label)
                .fontWeight(.bold)
                .padding(2)
            
            Text(text)
                .padding(2)
        
        
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(10)
        .background(Color(colorScheme == .dark ? UIColor.systemGray6 : UIColor.white).cornerRadius(10))
        .padding(10)
        
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}

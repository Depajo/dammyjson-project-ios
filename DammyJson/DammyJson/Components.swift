//
//  Components.swift
//  DammyJson
//
//  Created by Joonatan De Pascale on 17.5.2023.
//

import Foundation
import SwiftUI

struct DoneButton: View {
    @Environment(\.presentationMode) var presentationMode
    @State var action: () -> Void
    var body: some View {
        Button("Done") {
            action()
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct MyTextField: View {
    @Environment(\.colorScheme) var colorScheme
    @State var title: String
    @Binding var text: String
    
    var body: some View {
        TextField(title, text: $text)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(10)
            .background(Color(colorScheme == .dark ? UIColor.systemGray6 : UIColor.white))
            .padding(.vertical, 10)
            
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

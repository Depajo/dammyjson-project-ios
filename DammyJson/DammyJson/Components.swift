//
//  Components.swift
//  DammyJson
//
//  Created by Joonatan De Pascale on 17.5.2023.
//

import Foundation
import SwiftUI

/// A view component for a "Done" button.
///
/// Use `DoneButton` to provide a button with a "Done" label.
/// When the button is pressed, it performs the specified action and go back to the previous view.
struct DoneButton: View {
    /// The presentation mode environment variable.
    @Environment(\.presentationMode) var presentationMode
    /// The action to be performed when the button is pressed.
    @State var action: () -> Void
    
    var body: some View {
            
        Button("Done") {
            action()
            presentationMode.wrappedValue.dismiss()
        }
    }
}

/// A customized text field component.
///
/// Use `MyTextField` to display a text field with a customizable title and validation styling.
struct MyTextField: View {
    /// The color scheme environment variable.
    @Environment(\.colorScheme) var colorScheme
    /// The validation status of the text field.
    var validation: Bool
    /// The title of the text field.
    @State var title: String
    /// The binding to the text value of the text field.
    @Binding var text: String
    
    var body: some View {
        
        VStack {
            Text(title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 10)
            
            TextField(title, text: $text)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(10)
                .background(Color(colorScheme == .dark ?
                                  UIColor.systemGray6 :
                                    UIColor.white))
                .background(
                    RoundedRectangle(cornerRadius: 0)
                        .stroke(validation ? Color.green : Color.red)
                )
                .padding(.horizontal,10)
                
        }
        .padding(.vertical, 10)
            
    }
}

/// A view component for displaying a text area with label
///
/// Use `TextAreaWithLabel` to display a labeled text area with a customizable label and text content.
struct TextAreaWithLabel: View {
    /// The color scheme environment variable.
    @Environment(\.colorScheme) var colorScheme
    /// The label for the text area.
    var label: String
    /// The text content for the text area.
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
        .background(Color(colorScheme == .dark ?
                          UIColor.systemGray6 :
                            UIColor.white).cornerRadius(10))
        .padding(10)
        
    }
}

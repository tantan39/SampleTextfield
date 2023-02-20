//
//  LoginView.swift
//  ValidateTextfield
//
//  Created by Tan Tan on 2/20/23.
//

import SwiftUI

enum InputField {
    case email, password
}

struct LoginView: View {
    
    @State var email: String = ""
    @State var password: String = ""

    @State var focusedField: InputField? = .email
    
    var body: some View {
        VStack {
            /// @FocusState require deployment target version at least 15.0
            /// so we need to replace with UITextfield which is provied by UIKit
            VStack {
                CustomUITextField(
                    text: $email,
                    focusedField: $focusedField,
                    fieldKind: .email,
                    isFirstResponder: focusedField == .email,
                    placeHolder: "Enter email")
                .frame(width: 200, height: 40)
                
                CustomUITextField(
                    text: $password,
                    focusedField: $focusedField,
                    fieldKind: .password,
                    isFirstResponder: focusedField == .password,
                    placeHolder: "Enter password")
                .frame(width: 200, height: 40)
            }
            
            
            Button {
                if focusedField == .email {
                    focusedField = .password
                } else {
                    focusedField = nil
                }
            } label: {
                Text("Next")
            }

        }
    }
}

struct TestViewPreview: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

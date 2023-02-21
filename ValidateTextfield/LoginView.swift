//
//  LoginView.swift
//  ValidateTextfield
//
//  Created by Tan Tan on 2/20/23.
//

import SwiftUI

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var isEmailFocusing: Bool = true
    @State var isPasswordFocusing: Bool = false
    @State var models: [Bool] = [
        true,
        false,
    ]
    
    var body: some View {
        VStack {
            /// @FocusState require deployment target version at least 15.0
            /// so we need to replace with `UITextfield` which is provied by UIKit
            VStack {
                ForEach(Array(models.enumerated()), id: \.offset) { index, element in
                    CustomUITextField(
                        text: $email,
                        isFocus: element,
                        isLastItem: index == models.count - 1,
                        placeHolder: "Enter email")
                    .frame(width: 200, height: 40)
                }
            }
            
            Button {
                for (idx, _) in models.enumerated() {
                    models[idx].toggle()
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

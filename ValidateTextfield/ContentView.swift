//
//  ContentView.swift
//  ValidateTextfield
//
//  Created by Tan Tan on 2/20/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TestView()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TestView: View {
    @State var email: String = ""
    @State var isEmailFocusing: Bool = false
    
    var body: some View {
        VStack {
            /// @FocusState require deployment target version at least 15.0
            /// so we need to replace with UITextfield which is provied by UIKit
            CustomUITextField(
                text: $email,
                isFirstResponder: isEmailFocusing)
            .frame(width: 200, height: 40)
            
            Toggle("Enable email", isOn: $isEmailFocusing)
        }
        .onChange(of: isEmailFocusing) { newValue in
            isEmailFocusing = newValue
        }
    }
}

struct TestViewPreview: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}


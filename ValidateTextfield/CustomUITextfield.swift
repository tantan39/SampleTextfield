//
//  CustomUITextfield.swift
//  ValidateTextfield
//
//  Created by Tan Tan on 2/20/23.
//

import SwiftUI

struct CustomUITextField: UIViewRepresentable {
    class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var text: String

        fileprivate var didBecomeFirstResponder: Bool? = nil
        fileprivate var didResignFirstResponder: Bool? = nil

        init(text: Binding<String>) {
            _text = text
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            DispatchQueue.main.async {
                self.text = textField.text ?? ""
            }
        }
    }

    @Binding var text: String
    var isFirstResponder: Bool

    func makeUIView(context: UIViewRepresentableContext<CustomUITextField>) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.delegate = context.coordinator
        textField.layer.borderColor = UIColor.darkGray.cgColor
        textField.layer.borderWidth = 0.1
        textField.layer.cornerRadius = 15
        textField.placeholder = "Placeholder..."
        textField.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return textField
    }

    func makeCoordinator() -> CustomUITextField.Coordinator {
        return Coordinator(text: $text)
    }

    func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<CustomUITextField>) {
        uiView.text = text
        if isFirstResponder && context.coordinator.didBecomeFirstResponder != true{
            uiView.becomeFirstResponder()
            context.coordinator.didBecomeFirstResponder = true
            context.coordinator.didResignFirstResponder = false
        } else if !isFirstResponder && context.coordinator.didResignFirstResponder != true {
            uiView.resignFirstResponder()
            context.coordinator.didResignFirstResponder = true
            context.coordinator.didBecomeFirstResponder = false
        }
    }
}

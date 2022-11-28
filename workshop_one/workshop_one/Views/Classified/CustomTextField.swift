//
//  CustomTextField.swift
//  workshop_one
//
//  Created by Adrien SIMON on 24/11/2022.
//

import SwiftUI

struct TextFieldRepresentable: UIViewRepresentable {
    let goal: Int
    
    func makeUIView(context: Context) -> UITextField {
        let textField = CustomTextField()
        textField.delegate = context.coordinator
        return textField
    }
        
    func updateUIView(_ textField: UITextField, context: Context) {
        context.coordinator.goal = goal
        let count = context.coordinator.currentText.count
        textField.layer.borderColor =
            count == goal
            ? UIColor.systemPink.cgColor
            : nil
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var goal = 0
        var currentText = ""
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            
            let replacementText = (currentText as NSString).replacingCharacters(in: range, with: string)
            textField.layer.borderColor =
                replacementText.count == goal
                ? UIColor.systemPink.cgColor
                : nil
            currentText = replacementText
            return true
        }
    }
}

class CustomTextField: UITextField {
    
    convenience init() {
        self.init(frame: .zero)
        layer.cornerRadius = 12
        layer.borderWidth = 1.0
    }
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        CGRect(x: bounds.origin.x + 10, y: bounds.origin.y + 8, width: bounds.size.width - 20, height: bounds.size.height - 16)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        self.textRect(forBounds: bounds)
    }
}

struct CustomTextFieldTester: View {
    @State private var countToMatch: Int = 1

    var body: some View {
        VStack {
            Stepper("\(countToMatch) chars", value: $countToMatch)
            
            TextFieldRepresentable(goal: countToMatch)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(.horizontal)
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextFieldTester()
    }
}

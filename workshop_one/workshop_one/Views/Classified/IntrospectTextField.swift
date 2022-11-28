import SwiftUI

struct TextFieldViewConfigurator: UIViewRepresentable {
    let configure: (UITextField) -> Void
    
    func makeUIView(context: Context) -> some UIView {
        UIView()
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        DispatchQueue.main.async {
            print(uiView.superview!)
            dump(uiView.superview!.superview!.subviews.map{ type(of: $0) })
            print(uiView.superview!.superview!.subviews.last!.subviews.first!)
            configure(uiView.superview!.superview!.subviews.last!.subviews.first! as! UITextField)
        }
    }
}

struct IntrospectTextField: View {
    @State private var text = ""
    var body: some View {
        TextField("", text: $text)
            .padding()
            .background(.yellow)
            .background(
                TextFieldViewConfigurator { textField in
                    textField.backgroundColor = .green
                    textField.becomeFirstResponder()
                }
            )
    }
}

struct IntrospectTextField_Previews: PreviewProvider {
    static var previews: some View {
        IntrospectTextField()
    }
}

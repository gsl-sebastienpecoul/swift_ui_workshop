import SwiftUI

struct UIViewConfigurator<ConfigurableView: UIView>: UIViewRepresentable {

    let configure: (ConfigurableView) -> Void
    
    func makeUIView(context: Context) -> some UIView {
        UIView()
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        DispatchQueue.main.async {
            if let view = findConfigurableView(in: uiView) {
                configure(view)
            }
        }
    }
    
    func findConfigurableView(in view: UIView?) -> ConfigurableView? {
        guard let view else { return nil }
        if let result = findConfigurableView(in: view.subviews) {
            return result
        }
        return findConfigurableView(in: view.superview)
    }
    
    func findConfigurableView(in subviews: [UIView]) -> ConfigurableView? {
        for subview in subviews {
            if let result = (subview as? ConfigurableView) ?? findConfigurableView(in: subview.subviews) {
                return result
            }
        }
        return nil
    }
}

struct Focused: ViewModifier {
    @State private var textField: UITextField?
    let isFocused: Bool
    
    init(_ isFocused: Bool) {
        self.isFocused = isFocused
    }
    
    func body(content: Content) -> some View {
        content
            .background(
                UIViewConfigurator<UITextField> { textField in
                    self.textField = textField
                }
            )
            .onChange(of: isFocused) {
                if $0 {
                    textField?.becomeFirstResponder()
                } else {
                    textField?.resignFirstResponder()
                }
            }
    }
}

extension View {
    func focused(_ isFocused: Bool) -> some View {
        modifier(Focused(isFocused))
    }
}

struct InspectTextField: View {
    @State private var text: String = ""
    @State private var isFocused: Bool = false
    @State private var refreshControl = UIRefreshControl()
    var body: some View {
        VStack {
            ScrollView {
                TextField("Text", text: $text)
                    .border(.orange)
                    .focused(isFocused)
            }
            Button("End refreshing") {
                refreshControl.endRefreshing()
            }
            Button("\(isFocused ? "Deselect" : "Select") TF") {
                isFocused.toggle()
            }
        }
        .background(
            UIViewConfigurator<UIScrollView> { scrollView in
                scrollView.refreshControl = refreshControl
            }
        )
        .padding()
    }
}

struct Introspect_Previews: PreviewProvider {
    static var previews: some View {
        InspectTextField()
    }
}

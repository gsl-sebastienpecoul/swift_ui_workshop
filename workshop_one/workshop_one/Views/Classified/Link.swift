import SwiftUI

public struct DSLink: Identifiable {
    
    public let text: String
    public let action: () -> Void
    public let id = UUID()
    var words: [Word] = []

    public init(text: String, action: @escaping () -> Void) {
        self.text = text
        self.action = action
    }
    
    struct Word: Identifiable {
        var text: String
        var frame: CGRect
        var range: NSRange
        let id = UUID()
    }
    
    var frames: [CGRect] {
        words.map(\.frame)
    }
    
    func contains(_ point: CGPoint) -> Bool {
        frames.contains {
            $0.contains(point)
        }
    }
}

struct TextViewWrapped: View {
    let text: String
    @State private var links: [DSLink]
    @State private var linkPressed: DSLink?
    @State private var linkHovered: DSLink?
    @State private var size: CGSize?
    let configuration: TextView.Configuration
    
    
    init(text: String, links: [DSLink], configuration: TextView.Configuration) {
        self.text = text
        _links = State(initialValue: links)
        self.configuration = configuration
    }
    var body: some View {
        Group {
            if #available(iOS 16, *) {
                TextView(
                    text: text,
                    links: $links,
                    linkPressed: linkPressed,
                    linkHovered: linkHovered,
                    configuration: configuration,
                    preferredWidth: .infinity
                )
            } else {
                GeometryReader { geo in
                    TextView(
                        text: text,
                        links: $links,
                        linkPressed: linkPressed,
                        linkHovered: linkHovered,
                        configuration: configuration,
                        preferredWidth: geo.size.width
                    )
                    .fixedSize()
                    .readSize {
                        let width = min(geo.size.width, $0.width)
                        let height = $0.height
                        size = .init(width: width, height: height)
                    }
                }
                .onChange(of: text, perform: { _ in
                    size = nil
                })
                .frame(width: size?.width, height: size?.height)
            }
        }
        .border(.yellow)
        .overlay(
            ForEach(links) { link in
                ForEach(link.words) { word in
                    PressableViewRepresentable(size: word.frame.size, onPress: { location in
                        if let _ = location {
                            linkPressed = link
                        } else {
                            linkPressed = nil
                        }
                    })
                    .frame(width: word.frame.width, height: word.frame.height)
                    .position(x: (word.frame.midX), y: word.frame.midY)
                    .onHover {
                        if $0 {
                            linkHovered = link
                        }
                    }
                }
            }
        )
        .onHover { _ in
            linkHovered = nil
        }
    }
}


struct TextView: UIViewRepresentable {
    let text: String
    @Binding var links: [DSLink]
    let linkPressed: DSLink?
    let linkHovered: DSLink?
    let configuration: Configuration
    let preferredWidth: CGFloat
    
    struct Configuration {
        let font: UIFont
        let textColor: UIColor
        let linkColor: UIColor
        let linkPressedColor: UIColor
        let linkHoverColor: UIColor
    }
    func makeUIView(context: Context) -> MyTextView {
        let textView = MyTextView()
        textView.isSelectable = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.isUserInteractionEnabled = true
        textView.textAlignment = .left
        textView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        textView.font = configuration.font
        textView.textColor = configuration.textColor
        return textView
    }

    func updateUIView(_ uiView: MyTextView, context: Context) {
        var textChanged = false
        uiView.preferredWidth = preferredWidth

        if uiView.attributedText.string != text {
            uiView.text = text
            textChanged = true
        }

        DispatchQueue.main.async {
            updateLinks(in: uiView, forceUpdate: textChanged)
            
            if let linkPressed {
                uiView.color(ranges: linkPressed.words.map(\.range), with: configuration.linkPressedColor)
            } else if let linkHovered {
                uiView.color(ranges: linkHovered.words.map(\.range), with: configuration.linkHoverColor)
            } else {
                uiView.color(ranges: nil, with: configuration.textColor)
                uiView.color(ranges: links.flatMap(\.words).map(\.range), with: configuration.linkColor)
            }
        }
    }
    
    @available(iOS 16.0, *)
    func sizeThatFits(_ proposal: ProposedViewSize, uiView: MyTextView, context: Context) -> CGSize? {
        guard let width = proposal.width else {
            return nil
        }

        return uiView.sizeThatFits(.init(width: width, height: .infinity))
    }
    
    private struct ProposedSize {
           let width: CGFloat?
           let height: CGFloat?
       }
    
    func updateLinks(in uiView: UITextView, forceUpdate: Bool) {
        
        var linksToPosition: [DSLink] = []
        
        for link in links {
            let words = link.text
            var newLink = link

            guard let range = text.range(of: words) else {
                newLink.words = []
                linksToPosition.append(newLink)
                continue
            }
            
            newLink.words = []
            let wordsRange = NSRange(range, in: text)
            var splittedWords = words.split(separator: " ")
            splittedWords = (0 ..< 2 * splittedWords.count - 1).map { $0 % 2 == 0 ? splittedWords[$0/2] : " " }

            for word in splittedWords {
                let ranges = words.ranges(of: word)
                for range in ranges {
                    let wordRange = NSRange(range, in: words)
                    let linkRange = NSRange(location: wordRange.location + wordsRange.location, length: wordRange.length)
                    if let textRange = linkRange.toTextRange(textInput: uiView) {
                        let word = DSLink.Word(text: String(word), frame: uiView.firstRect(for: textRange), range: linkRange)
                        newLink.words.append(word)
                    }
                }
            }
            
            linksToPosition.append(newLink)
        }
        
        if linksToPosition.map(\.frames) != self.links.map(\.frames) || forceUpdate {
            self.links = linksToPosition
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator: NSObject {
        var widthConstraint: NSLayoutConstraint?
    }
}

extension StringProtocol {
    func ranges<T: StringProtocol>(of string: T, options: String.CompareOptions = []) -> [Range<Index>] {
        var ranges: [Range<Index>] = []
        var start: Index = startIndex
        
        while let range = range(of: string, options: options, range: start ..< endIndex) {
            ranges.append(range)
            
            if !range.isEmpty {
                start = range.upperBound               // if not empty, resume search at upper bound
            } else if range.lowerBound < endIndex {
                start = index(after: range.lowerBound) // if empty and not at end, resume search at next character
            } else {
                break                                  // if empty and at end, then quit
            }
        }
        
        return ranges
    }
}

class MyTextView: UITextView {
    var preferredWidth: CGFloat = .infinity
    override var intrinsicContentSize: CGSize {
        let newSize = systemLayoutSizeFitting(
                .init(width: preferredWidth, height: .infinity),
                withHorizontalFittingPriority: .required,
                verticalFittingPriority: .fittingSizeLevel
        )
        return newSize
    }

}

class PressableView: UIView {
    var size: CGSize = .zero
    var onPress: ((CGPoint?) -> Void)?
    
    override var intrinsicContentSize: CGSize {
        size
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.count == 1,
           let location = touches.first?.location(in: self) {
            onPress?(location)
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        onPress?(nil)
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        onPress?(nil)
    }
}

struct PressableViewRepresentable: UIViewRepresentable {
    let size: CGSize
    var onPress: ((CGPoint?) -> Void)

    func makeUIView(context: Context) -> PressableView {
        PressableView()
    }
    func updateUIView(_ uiView: PressableView, context: Context) {
        uiView.size = size
        uiView.onPress = onPress
    }
}


struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

extension View {
    func readSize(_ action: @escaping (CGSize) -> Void) -> some View {
        overlay(
            GeometryReader { geo in
                Color.clear
                    .preference(
                        key: SizePreferenceKey.self,
                        value: geo.size
                    )
            }
        )
        .onPreferenceChange(SizePreferenceKey.self, perform: action)
    }
}
extension UITextView {
    
    func color(ranges: [NSRange]?, with color: UIColor) {
        let attributedOriginalText = NSMutableAttributedString(attributedString: attributedText)
        
        if let ranges {
            for range in ranges {
                attributedOriginalText.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
            }
        } else {
            let fullRange = NSRange(location: 0, length: attributedOriginalText.length)
            attributedOriginalText.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: fullRange)
        }
        
        self.attributedText = attributedOriginalText
    }
}

extension NSRange {
    func toTextRange(textInput:UITextInput) -> UITextRange? {
        if let rangeStart = textInput.position(from: textInput.beginningOfDocument, offset: location),
           let rangeEnd = textInput.position(from: rangeStart, offset: length) {
            return textInput.textRange(from: rangeStart, to: rangeEnd)
        }
        return nil
    }
}

struct LinkTester: View {
    
    let links: [DSLink] = [
        .init(text: "Bonjour", action: { print("Tap Bonjour")}),
        .init(text: "longue histoire longue qui", action: { print("Tap longue histoire qui")})
    ]
    let text = "Bonjour nous qui allons raconter une très longue histoire longue qui commence par Hello, World! Bonjour nous allons raconter une très longue histoire qui commence par Hello, World!"
    @State private var choice: Int = 0
    let shortText = "Bonjour nous "

    @State private var isShort = false
    
    var body: some View {
        ScrollView {
            Picker("", selection: $choice) {
                Text("UITextView").tag(0)
                Text("SwiftUI").tag(1)
            }
            .pickerStyle(.segmented)
            Button("Short") {
                isShort.toggle()
            }
            if choice == 0 {
                TextViewWrapped(
                    text: isShort ? shortText : text,
                    links: links,
                    configuration: .init(font: .systemFont(ofSize: 18), textColor: .orange, linkColor: .green, linkPressedColor: .red, linkHoverColor: .yellow)
                )
            }
        }
    }
}

struct Link_Previews: PreviewProvider {
    static var previews: some View {
        LinkTester()
    }
}

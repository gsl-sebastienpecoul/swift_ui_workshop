import SwiftUI

struct OldTagTester: View {
    enum PickerChoice: String, CaseIterable {
        case small, big, reallyBig
        var description: String {
            switch self {
            case .small: return "Chips"
            case .big: return "French fries"
            case .reallyBig: return "The best french fries come from Brussels"
            }
        }
    }
    @State private var choice = PickerChoice.small
    var body: some View {
        VStack {
            Picker("", selection: $choice) {
                ForEach(PickerChoice.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(.segmented)
            OldTag(text: choice.description)
                .fixedSize()
            OldTag(text: choice.description)            
        }
        .padding()
    }
}

struct OldTag: UIViewRepresentable {
    let text: String
    
    func makeUIView(context: Context) -> OldTagView {
        OldTagView(text: text)
    }
    
    func updateUIView(_ uiView: OldTagView, context: Context) {
        uiView.text = text
    }
    
    func sizeThatFits(_ proposal: ProposedViewSize, uiView: OldTagView, context: Context) -> CGSize? {
        guard let proposedWidth = proposal.width,
              proposedWidth < uiView.intrinsicContentSize.width
        else {
            return uiView.intrinsicContentSize
        }
        uiView.translatesAutoresizingMaskIntoConstraints = false
        uiView.widthAnchor.constraint(equalToConstant: proposedWidth).isActive = true

        return CGSize(width: proposedWidth, height: uiView.intrinsicContentSize.height)
    }
}

final class OldTagView: UIStackView {
    init(text: String) {
        self.text = text
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        let width = icon.intrinsicContentSize.width + label.intrinsicContentSize.width + 40 + 10
        let height = icon.intrinsicContentSize.height + 20
        return CGSize(width: width, height: height)
        
    }
    
    var text: String {
        didSet {
            updateUI()
        }
    }

    func updateUI() {
        label.text = text
        invalidateIntrinsicContentSize()
    }
    
    private let icon: UILabel = {
        let label = UILabel()
        label.text = "🍟"
        label.font = .systemFont(ofSize: 30)
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 23)
        label.numberOfLines = 1
        return label
    }()
    
    private func setupUI() {
        layoutMargins = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        isLayoutMarginsRelativeArrangement = true
        addArrangedSubview(icon)
        addArrangedSubview(label)
        backgroundColor = .systemPink
        layer.cornerRadius = 12
        spacing = 10
        updateUI()
    }
    
}

struct OldTag_Previews: PreviewProvider {
    static var previews: some View {
        OldTagTester()
    }
}

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
            
            // The tag
            // OldTag(text: choice.description)
            // Should replace this Text
            Text(choice.description)
        }
        .padding()
    }
}

// Should be an UIViewRepresentable which wraps the OldTagView
struct OldTag {
    let text: String
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

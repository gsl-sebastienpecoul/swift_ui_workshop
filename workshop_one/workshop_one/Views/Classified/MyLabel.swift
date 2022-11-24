import SwiftUI

struct MyLabel: UIViewRepresentable {
    let text: String
    
    init(text: String) {
       self.text = text
    }
    
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.backgroundColor = .yellow
        return label
    }
    
    func updateUIView(_ label: UILabel, context: Context) {
       label.text = text
    }
    
    func sizeThatFits(
        _ proposal: ProposedViewSize,
        uiView: UILabel,
        context: Context) -> CGSize?
    {
        guard let width = proposal.width,
              let height = proposal.height else { return nil }
        let proposalSize = CGSize(width: width, height: height)
        return uiView.sizeThatFits(proposalSize)
    }
    
    func makeCoordinator() -> () {}
}

struct MyLabel_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .leading) {
            MyLabel(text: "My very label text")
                .border(.red)
            MyLabel(text: "My very very very very very very very very very very very label text")
                .border(.red)
        }
    }
}

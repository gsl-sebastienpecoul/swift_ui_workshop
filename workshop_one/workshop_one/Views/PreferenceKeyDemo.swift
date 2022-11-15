import SwiftUI

/// The keynote example
struct PreferenceKeyDemo: View {
    @State private var totalTextWidths: CGFloat = 0
    var body: some View {
        GeometryReader { geo in
            HStack {
                Text("A first text")
                    .widthPreference()
                Text("A second text")
                    .widthPreference()
                if totalTextWidths <= geo.size.width {
                    Text("A third text")
                        .widthPreference()
                }
            }
            .fixedSize().lineLimit(1).font(.title)
            .frame(maxHeight: .infinity)
        }
        .onPreferenceChange(WidthPreferenceKey.self) {
            totalTextWidths = $0
        }
    }
}

struct WidthPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}

extension View {
    func widthPreference() -> some View {
        overlay(
            GeometryReader { geo in
                Color.clear
                    .preference(
                        key: WidthPreferenceKey.self,
                        value: geo.size.width
                    )
            }
        )
    }
}

struct PreferenceKeyDemo_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceKeyDemo()
    }
}

import SwiftUI

struct MainActionButtonStyle: ButtonStyle {
    @ViewBuilder func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(configuration.isPressed ?  DesignSystem.Color.secondary.color : DesignSystem.Color.primary.color)
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}

extension ButtonStyle where Self == MainActionButtonStyle {
    static var main: MainActionButtonStyle { MainActionButtonStyle() }
}

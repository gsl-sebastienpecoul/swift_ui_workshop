import SwiftUI

struct CustomVStack<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 14.0) {
            content
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .font(.dsBody)
    }
}

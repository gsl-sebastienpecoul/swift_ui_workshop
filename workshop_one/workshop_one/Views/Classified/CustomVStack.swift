import SwiftUI

struct CustomVStack<Content: View>: View {
    @ViewBuilder let content: Content
    
    var body: some View {
        VStack(alignment: .leading, spacing: 14.0) {
            content
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

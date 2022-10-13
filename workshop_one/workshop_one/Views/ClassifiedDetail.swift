import SwiftUI

struct ClassifiedDetail: View {
    
    @State private var isAlertPresented = false
    @State private var isSheetPresented = false

    @Binding var classified: Classified
    
    var body: some View {
        CustomVStack {
            ClassifiedListItem(classified: $classified)
            Divider()
            VStack(alignment: .leading, spacing: 8.0) {
                Text("Description")
                    .font(DesignSystem.Font.h1.font)
                Text(classified.description)
                    .lineLimit(5)
                Button("See more") {
                    isSheetPresented.toggle()
                }
                Spacer()
                Button {
                    isAlertPresented.toggle()
                } label: {
                    Label("Contact owner", systemImage: "phone")
                }
                .buttonStyle(.main)
                .frame(maxWidth: .infinity)
            }
            .font(DesignSystem.Font.body.font)
            .alert("Call owner at: XXX-XX-XX", isPresented: $isAlertPresented) {
                Button("Ok", role: .cancel) {}
            }
            .sheet(isPresented: $isSheetPresented, content: {
                CustomVStack {
                    Text("Description")
                        .font(DesignSystem.Font.h1.font)
                    Text(classified.description)
                        .font(DesignSystem.Font.body.font)
                }
                .padding()
            })
        }
        .padding()
    }
}

struct ClassifiedDetail_Previews: PreviewProvider {
    static var previews: some View {
        ClassifiedDetail(classified: .constant(Classified.mocks[0]))
        ClassifiedDetail(classified: .constant(Classified.mocks[2]))
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (9.7-inch)"))
    }
}

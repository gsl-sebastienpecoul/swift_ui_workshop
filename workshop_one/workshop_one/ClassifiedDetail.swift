import SwiftUI

struct ClassifiedDetail: View {
    
    @State private var isSheetPresented = false
    @State private var isAlertPresented = false
    
    @Binding var classified: Classified
    
    var body: some View {
        CustomVStack {
            ClassifiedListItem(classified: $classified)
            Divider()
                .padding()
            VStack(alignment: .leading, spacing: 8.0) {
                Text("Description")
                    .font(.title2)
                    .bold()
                Text(classified.description)
                    .lineLimit(2)
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
            .alert("Call owner at: XXX-XX-XX", isPresented: $isAlertPresented) {
                Button("Ok", role: .cancel) {}
            }
            .sheet(isPresented: $isSheetPresented, content: {
                CustomVStack {
                    Text("Description")
                        .font(.title)
                        .bold()
                    Text(classified.description)
                }
                .padding()
            })
            .padding()
        }
    }
}

struct ClassifiedDetail_Previews: PreviewProvider {
    static var previews: some View {
        ClassifiedDetail(classified: .constant(Classified.mocks[0]))
    }
}

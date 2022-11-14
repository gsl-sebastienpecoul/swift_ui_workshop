import SwiftUI

struct ClassifiedDetail: View {
    
    @Binding private var classified: Classified
    @State private var isAlertPresented = false
    @State private var isSheetPresented = false
    @StateObject var viewModel = ClassifiedDetailViewModel()
    
    init(classified: Binding<Classified>) {
        _classified = classified
    }
    
    var body: some View {
        CustomVStack {
            ClassifiedListItem(classified: $classified)
            Divider()
            VStack(alignment: .leading, spacing: 8.0) {
                descriptionView
                Text(viewModel.lastContactText)
                Spacer()
                contactOwnerView
            }
            .font(.dsBody)
            .alert("Call owner at: \(classified.ownerPhone)", isPresented: $isAlertPresented) {
                Button("Ok", role: .cancel) {}
            }
            .sheet(isPresented: $isSheetPresented, content: {
                DescriptionView(classified: classified)
            })
        }
        .padding()
    }
    
    // MARK: -
    
    var contactOwnerView: some View {
        Group {
            Button {
                isAlertPresented.toggle()
                viewModel.updateLastContactText()
            } label: {
                Label("Contact owner", systemImage: "phone")
            }
            .buttonStyle(.main)
            .frame(maxWidth: .infinity)
        }
    }
    
    var descriptionView: some View {
        Group {
            Text("Description")
                .font(.dsH1)
            Text(classified.description)
                .lineLimit(5)
            Button("See more") {
                isSheetPresented.toggle()
            }
            .accessibilityHidden(true)
        }
    }
}

struct ClassifiedDetail_Previews: PreviewProvider {
    static var previews: some View {
        ClassifiedDetail(classified: .constant(Classified.mocks[0]))
        ClassifiedDetail(classified: .constant(Classified.mocks[2]))
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (9.7-inch)"))
    }
}

final class ClassifiedDetailViewModel: ObservableObject {
    
    @Published var lastContactText: String = ""
    
    func updateLastContactText() {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/YYYY 'at' HH':'mm':'ss"
        lastContactText = "Contacted the \(formatter.string(from: Date()))"
    }
}

struct DescriptionView: View {
    
    let classified: Classified
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        CustomVStack {
            Text("Description")
                .font(.dsH1)
            Text(classified.description)
                .font(.dsBody)
            Button("Dismiss") {
                presentationMode.wrappedValue.dismiss()
            }
        }
        .padding()
    }
}

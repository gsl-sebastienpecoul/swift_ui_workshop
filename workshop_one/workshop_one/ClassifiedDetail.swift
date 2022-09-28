import SwiftUI

struct ClassifiedDetail: View {
    
    @State private var isSheetPresented = false
    
    var body: some View {
        VStack {
            ClassifiedListItem()
            Divider()
                .padding()
            VStack(alignment: .leading, spacing: 8.0) {
                Text("Description")
                    .font(.title2)
                    .bold()
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur varius auctor massa sed sodales. Integer non lorem diam.")
                Button("See more") {
                    isSheetPresented.toggle()
                }
            }
            .sheet(isPresented: $isSheetPresented, content: {
                VStack(alignment: .leading, spacing: 8.0) {
                    Text("Description")
                        .font(.title)
                        .bold()
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur varius auctor massa sed sodales. Integer non lorem diam. Sed dapibus blandit dignissim. Fusce quis dolor augue. Nunc molestie velit non diam dignissim, quis aliquam lacus ultricies. Aliquam enim ante, malesuada ac sagittis at, dapibus vitae elit. Vivamus vulputate sem in facilisis placerat. Pellentesque at ligula mattis, maximus ligula sed, varius est. In orci odio, laoreet at nisl vitae, porttitor posuere lectus. Integer eleifend mi erat, sit amet convallis lorem consequat vitae. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam viverra mi faucibus ligula ullamcorper suscipit. Phasellus vitae quam dictum, fermentum purus eu, volutpat orci. Vestibulum vel velit posuere sem ornare consequat quis et odio.")
                }
                .frame(maxHeight: .infinity, alignment: .top)
                .padding()
            })
            .padding()
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct ClassifiedDetail_Previews: PreviewProvider {
    static var previews: some View {
        ClassifiedDetail()
    }
}

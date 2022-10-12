import SwiftUI

struct ClassifiedListView: View {
    
    let gridItem = GridItem(.adaptive(minimum: 300), spacing: 8.0, alignment: .leading)
    
    @State var classifieds = Classified.mocks
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [gridItem]) {
                    ForEach($classifieds) { $classified in
                        NavigationLink {
                            ClassifiedDetail(classified: $classified)
                        } label: {
                            ClassifiedListItem(classified: $classified)    
                        }.buttonStyle(PlainButtonStyle())
                        
                        Divider()
                    }
                }
                .padding(16)
            }
            .navigationTitle("Classified list")
        }
    }
}

struct ClassifiedListView_Previews: PreviewProvider {
    static var previews: some View {
        ClassifiedListView()
    }
}



extension ButtonStyle where Self == MainActionButtonStyle {

    /// A button style that doesn't style or decorate its content while idle,
    /// but may apply a visual effect to indicate the pressed, focused, or
    /// enabled state of the button.
    ///
    /// To apply this style to a button, or to a view that contains buttons, use
    /// the ``View/buttonStyle(_:)-66fbx`` modifier.
    static var main: MainActionButtonStyle { MainActionButtonStyle() }
}

struct MainActionButtonStyle: ButtonStyle {
  
    @ViewBuilder func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(configuration.isPressed ?  DesignSystem.Color.secondary.color : DesignSystem.Color.primary.color)
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}

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
                                .navigationBarTitleDisplayMode(.inline)
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

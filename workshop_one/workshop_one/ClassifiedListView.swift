import SwiftUI

struct ClassifiedListView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    NavigationLink {
                        ClassifiedDetail()
                    } label: {
                        ClassifiedListItem()
                    }
                    
                    ClassifiedListItem()
                    ClassifiedListItem()
                    ClassifiedListItem()
                    ClassifiedListItem()
                    ClassifiedListItem()
                    ClassifiedListItem()
                }
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

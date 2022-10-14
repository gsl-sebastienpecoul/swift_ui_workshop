import SwiftUI

struct ClassifiedListView: View {
    
    let gridItem = GridItem(.adaptive(minimum: 300), spacing: 8.0, alignment: .leading)
    
    @State private var classifieds: [Classified] = []
    let service = ClassifiedService()

    var body: some View {
        NavigationView {
            
            ScrollView {
                if classifieds.isEmpty {
                    ProgressView()
                }
                LazyVGrid(columns: [gridItem]) {
                    ForEach($classifieds) { $classified in
                        VStack(spacing: 0) {
                            ClassifiedListItem(classified: $classified)
                                    .contentShape(Rectangle())
                            Divider()
                                .padding(.vertical)
                        }
                        .task {
                            if classified.id == classifieds.last?.id {
                                await addNotAlreadyPresentsClassifieds()
                            }
                        }
                    }
                }
                .padding(.extralarge)
            }
            .navigationTitle("Listings")
        }
        .task {
            classifieds = await service.fetchClassifieds(in: 0.5)
        }
    }
    
    func addNotAlreadyPresentsClassifieds() async {
        let newClassifieds = await service.fetchClassifieds(in: 0.5)
        classifieds += newClassifieds.filter { classified in
            !classifieds.contains { $0.id == classified.id }
        }
    }
}

struct ClassifiedListView_Previews: PreviewProvider {
    static var previews: some View {
        ClassifiedListView()
        ClassifiedListView()
            .navigationViewStyle(.stack)
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (9.7-inch)"))
    }
}

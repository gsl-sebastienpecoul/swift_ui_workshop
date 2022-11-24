import SwiftUI

struct ClassifiedListItem: View {
    
    @Binding var classified: Classified
    @State private var biggerTagWidth = CGFloat.zero
    
    init(classified: Binding<Classified>) {
        self._classified = classified
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ImageView(url: classified.thumnbailPaths[0])
                .frame(height: 200)
                .overlay(alignment: .topTrailing) {
                    if classified.isNovelty ?? false {
                        ClassifiedLabel(color: .white, text: "New", minWidth: biggerTagWidth)
                    }
                }
                .overlay(alignment: .bottomLeading) {
                    ClassifiedLabel(color: .black, text: "The big 3D Visit", minWidth: biggerTagWidth)
                }
                .cornerRadius(.medium)
                .padding(.bottom, -22)
            FavoriteButton(isFavorite: $classified.isFavorite)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal)
                .padding(.bottom, -4)
            footer
        }
        .font(.dsBody)
        .onPreferenceChange(BiggerWidthPreferenceKey.self) {
            biggerTagWidth = $0
        }
    }
    
    var footer: some View {
        VStack(alignment: .leading) {
            Text(classified.price)
                .font(.dsH1)
            Text("Apartment")
            Text(classified.mainInformation)
            Text(classified.place)
                .font(.dsCaption)
        }
        .accessibilityElement(children: .combine)
    }
}

struct ClassifiedLabel: View {
    let color: Color
    let text: String
    let minWidth: CGFloat
    
    var body: some View {
        Text(text)
            .foregroundColor(color != .white ? .white : .black)
            .font(.dsCaption)
            .padding(.extrasmall)
            .frame(minWidth: minWidth)
            .overlay(
                GeometryReader { geo in
                    Color.clear
                        .preference(
                            key: BiggerWidthPreferenceKey.self,
                            value: geo.size.width
                        )
                }
            )
            .background(color)
            .cornerRadius(.small)
            .padding(.medium)
    }
}

struct BiggerWidthPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(nextValue(), value)
    }
}

extension View {
    func maxWidthPreference() -> some View {
        overlay(
            GeometryReader { geo in
                Color.clear
                    .preference(
                        key: BiggerWidthPreferenceKey.self,
                        value: geo.size.width
                    )
            }
        )
    }
}

struct ClassifiedListItem_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            ClassifiedListItem(classified: .constant(Classified.mocks[0]))
            ClassifiedListItem(classified: .constant(Classified.mocks[1]))
            ClassifiedListItem(classified: .constant(Classified.mocks[2]))
        }
        .padding()
    }
}

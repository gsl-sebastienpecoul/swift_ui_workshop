import SwiftUI

struct ClassifiedListItem: View {
    
    @Binding var classified: Classified
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12.0) {
            ImageView(url: classified.thumnbailPaths[0])
                .frame(height: 200)
                .overlay(alignment: .topTrailing) {
                    if classified.isNovelty ?? false {
                        ClassifiedLabel(color: .white, text: "New")
                    }
                }
                .overlay(alignment: .bottomLeading) {
                    ClassifiedLabel(color: .black, text: "3D Visit")
                }
                .cornerRadius(DesignSystem.CornerRadius.medium.rawValue)
                .padding(.bottom, -34)
            FavoriteButton(isFavorite: $classified.isFavorite)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal)
            footer
        }
        .font(DesignSystem.Font.body.font)
    }
    
    var footer: some View {
        VStack(alignment: .leading) {
            Text(classified.price)
                .font(DesignSystem.Font.h1.font)
            Text("Apartment")
            Text(classified.mainInformation)
            Text(classified.place)
                .font(DesignSystem.Font.caption.font)
        }
    }
}

struct ClassifiedLabel: View {
    let color: Color
    let text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(color != .white ? .white : .black)
            .font(.caption)
            .padding(8.0)
            .background(color)
            .cornerRadius(DesignSystem.CornerRadius.small.rawValue)
            .padding(8.0)
    }
}

struct ClassifiedListItem_Previews: PreviewProvider {
    static var previews: some View {
        ClassifiedListItem(classified: .constant(Classified.mocks[0]))
    }
}

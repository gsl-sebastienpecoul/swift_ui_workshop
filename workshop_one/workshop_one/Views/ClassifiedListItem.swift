import SwiftUI

struct ClassifiedListItem: View {
    
    @Binding var classified: Classified
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12.0) {
            ImageView(url: classified.thumnbailPaths[0])
                .overlay {
                    VStack(alignment: .trailing) {
                        if classified.isNovelty ?? false {
                            Text("Nouveauté")
                                .font(.caption)
                                .padding(8.0)
                                .background(Color.white)
                                .cornerRadius(DesignSystem.CornerRadius.small.rawValue)
                        }
                        
                        Spacer()
                        FavoriteButton(isFavorite: $classified.isFavorite)
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .frame(height: 250)
                .cornerRadius(DesignSystem.CornerRadius.medium.rawValue)
            VStack(alignment: .leading) {
                Text(classified.price)
                    .font(DesignSystem.Font.h1.font)
                Text("Appartement")
                    .font(DesignSystem.Font.body.font)
                Text(classified.mainInformation)
                    .font(DesignSystem.Font.body.font)
                Text(classified.place)
                    .font(DesignSystem.Font.caption.font)
            }
        }
    }
}

struct ClassifiedListItem_Previews: PreviewProvider {
    static var previews: some View {
        ClassifiedListItem(classified: .constant(Classified.mocks[0]))
    }
}

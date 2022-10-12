import SwiftUI

struct ClassifiedListItem: View {
    
    @Binding var classified: Classified
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12.0) {
            ImageView(url: classified.thumnbailPaths[0])
                .frame(height: 200)
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
                            FavoriteButton(binding: $classified.isFavorite)
                        }
                        .padding(16)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    }
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

struct ImageView: View {
    
    let url: String
    
    var body: some View {
        AsyncImage(url: URL(string: url)!) { image in
            image
                .resizable()
                .scaledToFill()
        }  placeholder: {
            Color.gray
        }
    }
}


struct FavoriteButton: View {
    
    
    init(binding: Binding<Bool>) {
        self._isFavorite = binding
    }
    
    @Binding var isFavorite: Bool
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.white.shadow(.drop(color: .black, radius: 4.0)))
                .frame(width: 44, height: 44)
            Button {
                isFavorite.toggle()
            } label: {
                Image(systemName: isFavorite ? "heart" : "heart.fill")
            }
            .accentColor(Color.red)
        }
    }
}

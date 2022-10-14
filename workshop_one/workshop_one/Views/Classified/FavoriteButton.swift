import SwiftUI

struct FavoriteButton: View {
    
    @Binding var isFavorite: Bool
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.white.shadow(.drop(color: .gray, radius: 4.0)))
                .frame(width: 44, height: 44)
            Button {
                isFavorite.toggle()
            } label: {
                Image(systemName: isFavorite ? "heart.fill" : "heart")
            }
            .accentColor(Color.red)
        }
        .accessibilityAddTraits(isFavorite ? [.isButton, .isSelected] : [.isButton])
        .accessibilityValue(isFavorite ? "Is favorite" : "Is not favorite" )
        .dynamicTypeSize(...DynamicTypeSize.accessibility1)
        .font(.title3)
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isFavorite: .constant(true))
        FavoriteButton(isFavorite: .constant(false))
    }
}

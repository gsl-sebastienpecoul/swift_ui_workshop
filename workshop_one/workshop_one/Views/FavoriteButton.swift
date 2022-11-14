import SwiftUI

/// Initial version
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
        .dynamicTypeSize(...DynamicTypeSize.accessibility1)
        .font(.title3)
        
    }
}

/// We extract the label in a sub view
struct NewFavoriteButton: View {
    
    @Binding var isFavorite: Bool
    
    var body: some View {
        Button {
            isFavorite.toggle()
        } label: {
            FavoriteButtonLabelFinal(isFavorite: isFavorite)
        }
    }
}

/// The ZStack version : the circle stretches if we don't fix its size
struct FavoriteButtonLabel: View {
    var isFavorite = true
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.white.shadow(.drop(color: .gray, radius: 4.0)))
                //.frame(width: 44, height: 44)
            Image(systemName: isFavorite ? "heart.fill" : "heart")
                .font(.title3)
                .foregroundColor(.red)
        }
    }
}

/// The Overlay version : the circle stretches if we don't fix its size
struct FavoriteButtonLabel2: View {
    var isFavorite = true
    
    var body: some View {
        Circle()
            .fill(.white.shadow(.drop(color: .gray, radius: 4.0)))
            //.frame(width: 44, height: 44)
            .overlay(
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .font(.title3)
                    .foregroundColor(.red)
            )
    }
}

/// The Background version : the circle fits if we don't fix its size
struct FavoriteButtonLabel3: View {
    var isFavorite = true
    
    var body: some View {
        Image(systemName: isFavorite ? "heart.fill" : "heart")
            .font(.title3)
            .foregroundColor(.red)
            //.frame(width: 44, height: 44)
            .background(
                    Circle()
                        .fill(.white.shadow(.drop(color: .gray, radius: 4.0)))
            )
    }
}

/// The Final version
struct FavoriteButtonLabelFinal: View {
    var isFavorite = true
    
    var body: some View {
        Image(systemName: isFavorite ? "heart.fill" : "heart")
            .font(.title3)
            .foregroundColor(.red)
            .padding(10)
            .frame(minWidth: 44, minHeight: 44)
            .background(
                    Circle()
                        .fill(.white.shadow(.drop(color: .gray, radius: 4.0)))
            )
    }
}

/// With an asset
struct FavoriteButtonLabelBeach: View {
    @ScaledMetric var scale: CGFloat = 1
    
    var body: some View {
        Button {
            // Action
        } label: {
            Image("beach")
                .resizable()
                .scaledToFit()
                .frame(width: 18 * scale, height: 18 * scale)
                .padding(10)
                .frame(minWidth: 44, minHeight: 44)
                .background(
                        Circle()
                            .fill(.white.shadow(.drop(color: .gray, radius: 4.0)))
                )
        }
        .accentColor(Color.red)
    }
}

/// Previews
struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            FavoriteButtonLabel()
            FavoriteButtonLabel2()
            FavoriteButtonLabel3()
        }
        NewFavoriteButton(isFavorite: .constant(false))
            .previewLayout(.fixed(width: 100, height: 100))
        FavoriteButtonLabelBeach()
            .previewLayout(.fixed(width: 100, height: 100))
    }
}

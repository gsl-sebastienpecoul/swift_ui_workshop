import SwiftUI

struct ClassifiedListItem: View {
    
    @Binding var classified: Classified
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
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
                .cornerRadius(.medium)
                .padding(.bottom, -22)
            FavoriteButton(isFavorite: $classified.isFavorite)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal)
                .padding(.bottom, -4)
            footer
        }
        .font(.dsBody)
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
    }
}

struct ClassifiedLabel: View {
    let color: Color
    let text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(color != .white ? .white : .black)
            .font(.dsCaption)
            .padding(.extrasmall)
            .background(color)
            .cornerRadius(.small)
            .padding(.medium)
    }
}

struct ClassifiedListItem_Previews: PreviewProvider {
    static var previews: some View {
        ClassifiedListItem(classified: .constant(Classified.mocks[0]))
    }
}

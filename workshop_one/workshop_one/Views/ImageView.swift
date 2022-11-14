import SwiftUI

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
        .frame(minWidth: 0, minHeight: 0)
        .aspectRatio(16/10, contentMode: .fit)
        .clipped()
        .clipShape(Rectangle())
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            ImageView(url: "https://picsum.photos/200/300")
                .padding()
            ImageView(url: "https://picsum.photos/200/300")
                .padding()
            ImageView(url: "https://picsum.photos/200/300")
                .padding()
            ImageView(url: "https://picsum.photos/200/300")
                .padding()
        }
    }
}

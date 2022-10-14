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
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(url: "https://v.seloger.com/s/cdn/x/visuels/1/7/8/z/178zh5cxxfa39z3fx29wb5dnuzqoyd96w403ivzzk.jpg")
    }
}

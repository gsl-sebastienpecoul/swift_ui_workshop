import SwiftUI

struct ClassifiedListItem: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12.0) {
            ZStack(alignment: .topTrailing) {
                Color.black
                AsyncImage(url: URL(string: "https://storage.gra.cloud.ovh.net/v1/AUTH_e0b83750570d4ff1986fe199b41300e4/kimono/1eff1624766e2f063732ed9951512842b9cf9aba/600x370-fit-cover-orientation-0deg?width=600&height=370&fit=cover")!) {
                    $0.image?
                        .resizable()
                        .scaledToFit()
                }
                Text("Nouveauté")
                    .font(.caption)
                    .padding(8.0)
                    .background(Color.white)
                    .cornerRadius(4.0)
                    .padding(16.0)
            }
            .frame(height: 200)
            .frame(maxWidth: .infinity)
            .cornerRadius(8.0)
            
            VStack(alignment: .leading) {
                Text("3 500€")
                    .font(.body)
                    .bold()
                Text("Appartement")
                    .font(.body)
                Text("77 m2 • 2 pièces • 1 chambre")
                    .font(.body)
                Text("Paris 16 ème")
                    .font(.caption)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}

struct ClassifiedListItem_Previews: PreviewProvider {
    static var previews: some View {
        ClassifiedListItem()
    }
}

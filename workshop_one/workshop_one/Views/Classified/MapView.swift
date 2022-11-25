import MapKit
import SwiftUI

struct MapViewTester: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 48.89127,
            longitude: 2.3505665
        ),
        latitudinalMeters: 100,
        longitudinalMeters: 100
    )
    
    var body: some View {
        MapView(region: $region)
            .overlay {
                Circle()
                    .frame(width: 20, height: 20)
                    .opacity(0.4)
            }
            .overlay(alignment: .bottom) {
                VStack {
                    Stepper(
                        "latitude \(region.center.latitude)",
                        value: $region.center.latitude, step: 0.0001
                    )
                    Stepper(
                        "longitude \(region.center.longitude)",
                        value: $region.center.longitude, step: 0.0001
                    )
                }
                .padding(5)
                .background(.white)
            }
    }
}

struct MapView: UIViewRepresentable {
    @Binding var region: MKCoordinateRegion
    
    func makeUIView(context: Context) -> some UIView {
        return MKMapView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

extension MKCoordinateRegion: Equatable {
    public static func == (lhs: MKCoordinateRegion, rhs: MKCoordinateRegion) -> Bool {
        lhs.center.latitude == rhs.center.latitude &&
        lhs.center.longitude == rhs.center.longitude &&
        lhs.span.latitudeDelta == rhs.span.latitudeDelta &&
        lhs.span.longitudeDelta == rhs.span.longitudeDelta
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapViewTester()
    }
}

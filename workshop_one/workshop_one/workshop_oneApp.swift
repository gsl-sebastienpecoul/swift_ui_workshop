import SwiftUI

@main
struct workshop_oneApp: App {
    var body: some Scene {
        WindowGroup {
            ClassifiedListItem(classified: Classified.mocks[0])
        }
    }
}

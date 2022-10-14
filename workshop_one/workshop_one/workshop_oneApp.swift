import SwiftUI

@main
struct workshop_oneApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ClassifiedListView()
                    .tabItem {
                        Label("Classified", systemImage: "house")
                    }
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
            }
        }
    }
}

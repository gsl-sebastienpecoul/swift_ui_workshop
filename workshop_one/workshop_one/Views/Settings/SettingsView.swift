import SwiftUI

struct SettingsView: View {
    
    @State var isConnected: Bool = false
    
    var body: some View {
        VStack {
            List {
                ForEach(settings) {
                    Text($0.title)
                }
            }
            .frame(height: 300)
            .animation(.default, value: isConnected)
            
            ConnectView(isConnected: $isConnected)
                .frame(maxHeight: .infinity, alignment: isConnected ? .top : .bottom)
                .animation(.default, value: isConnected)
        }
    }
    
    var settings: [SettingsItem] {
        if isConnected {
            return [
                SettingsItem(title: "My account"),
                SettingsItem(title: "CGU"),
                SettingsItem(title: "Tools"),
                SettingsItem(title: "Report a bug"),
                SettingsItem(title: "Alert & notifications"),
            ]
        } else {
            return [
                SettingsItem(title: "CGU"),
                SettingsItem(title: "Tools"),
                SettingsItem(title: "Report a bug"),
                SettingsItem(title: "Alert & notifications"),
            ]
        }
    }
}

struct ConnectView: View {
 
    @Binding var isConnected: Bool
    
    var body: some View {
        Button("Toggle connection", action: { isConnected.toggle() })
            .buttonStyle(.main)
    }
}

struct SettingsItem: Identifiable {
    var id: String { title }
    let title: String
    
    init(title: String) {
        self.title = title
    }
}

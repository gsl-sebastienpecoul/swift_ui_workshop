import Foundation
import UIKit
import SwiftUI

enum DesignSystem {
    
    enum CornerRadius: Double {
        case small = 4
        case medium = 8
        case large = 16
    }
    
    enum Font {
        case h1 
        case h2
        case body
        case caption
        
        var font: SwiftUI.Font {
            
            switch self {
            case .h1:
                let uiFont = UIFontMetrics(forTextStyle: .title1).scaledFont(for: UIFont(name: "SourceSansPro-Regular", size: 20)!)
                return SwiftUI.Font(uiFont)
            case .h2:
                let uiFont = UIFontMetrics(forTextStyle: .title2).scaledFont(for: UIFont(name: "SourceSansPro-Bold", size: 16)!)
                return SwiftUI.Font(uiFont)
            case .body:
                let uiFont = UIFontMetrics(forTextStyle: .body).scaledFont(for: UIFont(name: "SourceSansPro-Regular", size: 12)!)
                return SwiftUI.Font(uiFont)
            case .caption:
                let uiFont = UIFontMetrics(forTextStyle: .footnote).scaledFont(for: UIFont(name: "SourceSansPro-Bold", size: 10)!)
                return SwiftUI.Font(uiFont)
            }
        }
    
    }
    
    enum Color {
        case primary
        case secondary
        case background
        
        var color: SwiftUI.Color {
            switch self {
            case .primary:
                return SwiftUI.Color(hex: "26408B")
            case .secondary:
                return SwiftUI.Color(hex: "0F084B")
            case .background:
                return SwiftUI.Color(hex: "0D0221")
            }
        }
    }
}


extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

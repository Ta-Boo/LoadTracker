import SwiftUI

struct LoaderTabBarItem {
    let icon: String
    let foregroundColor: Color
    let backgroundColor: Color
    
    init(icon: String,
         backgroundColor: Color,
         foregroundColor: Color){
        self.icon = icon
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
    }
}


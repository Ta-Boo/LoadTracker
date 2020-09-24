import SwiftUI

struct LoaderTabBarShape : Shape {
    var curvePos : CGFloat
    var animatableData: CGFloat{
        get{return curvePos}
        set{curvePos = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        let centerWidth = curvePos
        let buttonSize: CGFloat = 52
        let depth: CGFloat = buttonSize * 0.72
        return Path{path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: (centerWidth - buttonSize * 0.86), y: 0))

            // direction: down
            path.addCurve(to: CGPoint(x: centerWidth - (buttonSize * 0.64), y: (buttonSize * 0.22)),
                          control1: CGPoint(x: (centerWidth - (buttonSize * 0.71)), y: 0),
                          control2: CGPoint(x: (centerWidth - (buttonSize * 0.64)), y: buttonSize * 0.12))
            path.addCurve(to: CGPoint(x: centerWidth, y: depth),
                          control1: CGPoint(x: centerWidth - (buttonSize * 0.64), y: buttonSize * 0.46),
                          control2: CGPoint(x: (centerWidth - (buttonSize * 0.4)), y: depth))

            // direction: up
            path.addCurve(to: CGPoint(x: centerWidth + (buttonSize * 0.64), y: (buttonSize * 0.22)),
                          control1: CGPoint(x: (centerWidth + (buttonSize * 0.4)), y: depth),
                          control2: CGPoint(x: centerWidth + (buttonSize * 0.64), y: buttonSize * 0.46))
            path.addCurve(to: CGPoint(x: (centerWidth + buttonSize * 0.86), y: 0),
                          control1: CGPoint(x: (centerWidth + (buttonSize * 0.64)), y: buttonSize * 0.12),
                          control2: CGPoint(x: (centerWidth + (buttonSize * 0.71)), y: 0))
            
            // close path
            path.addLine(to: CGPoint(x: rect.maxX, y: 0))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: 0, y: rect.maxY))
            path.closeSubpath()
        }
    }
}

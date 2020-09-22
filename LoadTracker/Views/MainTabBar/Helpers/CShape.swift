import SwiftUI

struct CShape : Shape {
    var curvePos : CGFloat
    var animatableData: CGFloat{
        get{return curvePos}
        set{curvePos = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        return Path{path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.move(to: CGPoint(x: curvePos + 40, y: 0))
            path.addQuadCurve(to: CGPoint(x: curvePos - 40, y: 0), control: CGPoint(x: curvePos, y: 70))
        }
        
    }
}

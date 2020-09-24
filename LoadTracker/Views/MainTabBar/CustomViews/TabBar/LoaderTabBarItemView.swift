import SwiftUI

struct LoaderTabBarItemView: View {
    @Binding var selected: Int
    @Binding var selectedPosition: CGFloat
    let item: LoaderTabBarItem
    let index: Int
    let colors: LoaderTabBarColor

    var body: some View {
        GeometryReader{ g in
            Button(action: {
                withAnimation(.spring()){
                    selected = index
                    self.selectedPosition = g.frame(in: .global).midX
                }
            }, label: {
                Image(systemName: item.icon)
                    .renderingMode(.template)
                    .resizable()
                    .foregroundColor(isSelected ? colors.selected : colors.unselected  )
                    .frame(width: 28, height: 28)
                    .padding(.all, 15)
                    .background(colors.foreground.opacity(isSelected ? 1 : 0).clipShape(Circle()))
                    .offset(y: isSelected ? -24 : 0)
            })
            .frame(width: 36)
            .onAppear {
                DispatchQueue.main.async {
                    self.selectedPosition = g.frame(in: .global).midX
                }
            }
        }
        .frame(width: 36)
        .offset(y: -30)
    }
    
    var isSelected : Bool{
        selected == index
    }
}

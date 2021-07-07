import SwiftUI

// Todo: create framework from this

struct LoaderTabBarColor {
    let foreground, selected, unselected: Color
}

struct LoaderTabBar: View {
    @Binding var selectedIndex: Int
    @Binding var selectedPosition: CGFloat
    let colors: LoaderTabBarColor
    public let items: [LoaderTabBarItem]
    
    
    var body: some View {
        HStack(alignment: .bottom) {
            ForEach(0..<items.count) { index in
                self.generateTabItem(at: index)
                if index != self.items.count-1 {
                    Spacer()
                }
            }
        }
        .frame(height: 36)
        .padding(.top, 22)
        //        .padding(.bottom, 10)
        .padding(.horizontal, 28)
        .offset(y: 5.0)
        .animation(.default)
        .foregroundColor(colors.foreground)
        .background(colors.foreground.clipShape(LoaderTabBarShape(curvePos: selectedPosition)))
    }
    
    func generateTabItem(at index: Int) -> some View {
        Button(action: {
            withAnimation { self.selectedIndex = index }
        }) {
            LoaderTabBarItemView(selected: self.$selectedIndex,
                                 selectedPosition: self.$selectedPosition,
                                 item: items[index],
                                 index: index,
                                 colors: colors)
        }
        .disabled(selectedIndex == index)
    }
}

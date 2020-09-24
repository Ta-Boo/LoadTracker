import SwiftUI

struct MainTabBarView : View {
    @State var index = 0
    @State var curvePos : CGFloat = 0
    
    let items: [LoaderTabBarItem] = [
        LoaderTabBarItem(icon: "waveform.path.ecg"),
        LoaderTabBarItem(icon: "calendar"),
        LoaderTabBarItem(icon: "flame"),
    ]
    
    
    
    var body: some View{
        ZStack {
            switch index {
            case 0:
                WorkoutPlan()
            case 1 :
                CaloriesPlan()
            default:
                WorkoutPlan()
            }
            VStack {
                Spacer()
                LoaderTabBar(selectedIndex: $index,
                             selectedPosition: $curvePos,
                             colors: LoaderTabBarColor(foreground: .pink,
                                                       selected: .white,
                                                       unselected: .black),
                             items: items)
            }
            
        }
    }
}

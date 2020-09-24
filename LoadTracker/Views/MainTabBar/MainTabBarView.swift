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
                    .background(Assets.Colors.primary)
                    .ignoresSafeArea(.all, edges: .top)
            case 1 :
                CaloriesPlan()
                    .background(Assets.Colors.primary)
                    .ignoresSafeArea(.all, edges: .top)
            default:
                WorkoutPlan()
                    .background(Assets.Colors.primary)
                    .ignoresSafeArea(.all, edges: .top)
            }
            VStack {
                Spacer()
                LoaderTabBar(selectedIndex: $index,
                             selectedPosition: $curvePos,
                             colors: LoaderTabBarColor(foreground: .pink,
                                                       selected: .white,
                                                       unselected: Assets.Colors.accent),
                             items: items)
            }
            
        }
        .edgesIgnoringSafeArea(.top)
    }
}

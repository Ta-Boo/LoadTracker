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
        VStack {
            switch index {
            case 0:
                WorkoutPlan()
            case 1 :
                CaloriesPlan()
            default:
                WorkoutPlan()
            }
            VStack {
                LoaderTabBar(selectedIndex: $index,
                             selectedPosition: $curvePos,
                             colors: LoaderTabBarColor(foreground: .pink,
                                                       selected: .white,
                                                       unselected: Assets.Colors.accent),
                             items: items)
            }
            
        }
        .background(Assets.Colors.primary)
        .edgesIgnoringSafeArea(.vertical)
    }
    init() {
        AppCache.showOnboarding = false
    }
}

#if DEBUG
struct MainTabBar_Previews: PreviewProvider {
   static var previews: some View {
      Group {
        MainTabBarView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            .previewDisplayName("iPhone 8")

        MainTabBarView()
            .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
            .previewDisplayName("iPhone XS Max")
      }
   }
}
#endif

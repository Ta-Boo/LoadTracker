import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
            .ignoresSafeArea(.all, edges: .vertical)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


struct Home : View {
    @State var index = 0
    @State var curvePos : CGFloat = 0
    
    let items: [LoaderTabBarItem] = [
        LoaderTabBarItem(icon: "waveform.path.ecg", backgroundColor: Color.red, foregroundColor: Color.green),
        LoaderTabBarItem(icon: "calendar", backgroundColor: Color.red, foregroundColor: Color.green),
        LoaderTabBarItem(icon: "flame", backgroundColor: Color.red, foregroundColor: Color.green)
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

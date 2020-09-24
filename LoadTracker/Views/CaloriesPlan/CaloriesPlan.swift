//
//  CaloriesPlan.swift
//  LoadTracker
//
//  Created by hladek on 20/09/2020.
//

import SwiftUI
import Alamofire

struct CaloriesPlan: View {
    @State var sliderValue: Double = 0
    @State  var loaded = false
    let data = [BarChartData(id: 0, name: "21.9", value: 789),
                BarChartData(id: 1, name: "22.9", value: 1489),
                BarChartData(id: 2, name: "23.9", value: 500),
                BarChartData(id: 3, name: "24.9", value: 1946),
                BarChartData(id: 4, name: "25.9", value: 1200),
                BarChartData(id: 5, name: "26.9", value: 1983),
                BarChartData(id: 6, name: "27.9", value: 2894),
                BarChartData(id: 7, name: "28.9", value: 1790)
    ]

    var body: some View {
        ZStack {
            Color("Primary")
            VStack{
                Spacer().frame(height: 30)
                ZStack {
                    BarChartView(dataWrapper: BarCharDataWrapper(title: "Calories Income",
                                                                 bacgroundColors: BarChartColors(primary: .clear, secondary: .clear),
                                                                 chartsColors: BarChartColors(primary: Assets.Colors.secondary, secondary: Assets.Colors.primary),
                                                                 textColors: BarChartColors(primary: Assets.Colors.text, secondary: Assets.Colors.accent),
                                                                 data: data))
                }
                
                
                Spacer()
            }
        }
    }
    
}

struct CaloriesPlan_Previews: PreviewProvider {
    static var previews: some View {
        CaloriesPlan()
    }
}

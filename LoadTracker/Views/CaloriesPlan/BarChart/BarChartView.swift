//
//  BarChartView.swift
//  LoadTracker
//
//  Created by hladek on 24/09/2020.
//

import SwiftUI

struct BarChartData: Identifiable {
    let id: Int
    let name: String
    let value: Int
}
struct BarChartLabel: Identifiable {
    let id: Int
    let title: String
}

struct BarChartColors {
    let primary: Color
    let secondary: Color
}
struct BarCharDataWrapper{
    let title: String
    let bacgroundColors: BarChartColors
    let chartsColors: BarChartColors
    let textColors: BarChartColors
    let data: [BarChartData]
}

struct BarChartView: View {
    
    var dataWrapper: BarCharDataWrapper
    var labels: [BarChartLabel] {
        guard let max = dataWrapper.data.map({ $0.value }).max() else {
            return [BarChartLabel(id: 0, title: "")]
        }
        return [BarChartLabel(id: 0, title: "\(max)"),
                BarChartLabel(id: 1, title: "\(Int(Double(max) * 0.66))"),
                BarChartLabel(id: 2, title: "\(Int(Double(max) * 0.33))")
        ]
    }
    @State var animate = false
    var body: some View {
        GeometryReader { geometry in
            
            LinearGradient(gradient: Gradient(colors: [dataWrapper.bacgroundColors.primary.opacity(0.1), dataWrapper.bacgroundColors.secondary.opacity(0.8)]), startPoint: .top, endPoint: .bottom)
                .mask(RoundedRectangle(cornerRadius: 25))
                .padding()
            ZStack {
                VStack {
                    Spacer()
                    HStack{
                        VStack{
                            ForEach(labels){ label in
                                Text(label.title)
                                    .font(.system(size: 10))
                                    .lineLimit(1)
                                    .rotationEffect(.degrees(-45))
                                    .foregroundColor(dataWrapper.textColors.secondary)
                                    .padding([.leading, .top],5)
                                    .frame(width: 32)
                                Spacer()
                            }
                        }
                        Spacer()
                        ForEach(dataWrapper.data) { chartData in
                            VStack {
                                Spacer()
                                LinearGradient(gradient: Gradient(colors: [dataWrapper.chartsColors.primary, dataWrapper.chartsColors.secondary]), startPoint: .top, endPoint: .bottom)
                                    .mask(RoundedRectangle(cornerRadius: (pow(2, -(CGFloat(dataWrapper.data.count) * 0.5 - 5)) + CGFloat(6))))
                                    
                                    .frame(height: geometry.size.height * (animate ? calculateChartHeight(chartValue: chartData.value) : 0.05))
                                    .animation(.interpolatingSpring(stiffness: 80, damping: 50))
                                
                                Text("\(chartData.name)")
                                    .font(.system(size: 12))
                                    .foregroundColor(dataWrapper.textColors.secondary)
                                    .rotationEffect(.degrees(-45))
                                    .lineLimit(1)
                            }
                            Spacer()
                        }
                    }.padding()
                    Spacer().frame(height:geometry.size.height * 0.05)
                    
                }
                VStack {
                    HStack{
                        Spacer()
                        Text(dataWrapper.title)
                            .font(.title2)
                            .foregroundColor(dataWrapper.textColors.primary)
                            .padding(.top)
                        Spacer()
                    }
                    Spacer()
                }
            }
            
        }
        .frame(height: 300)
        .onAppear{
            self.animate = true
        }
    }
    
    private func calculateChartHeight(chartValue: Int) -> CGFloat {
        guard let maxChart = dataWrapper.data.map({ $0.value }).max() else {
            return 0
        }
        let result = CGFloat((1.0 / Double(maxChart) * Double(chartValue)))
        return result * 0.6
    }
}

#if DEBUG
struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        let data = [BarChartData(id: 0, name: "asd", value: 50),BarChartData(id: 1, name: "asd", value: 500),BarChartData(id: 2, name: "asd", value: 50)]
        BarChartView(dataWrapper: BarCharDataWrapper(title: "Calories Income",
                                                     bacgroundColors: BarChartColors(primary: .white, secondary: .white),
                                                     chartsColors: BarChartColors(primary: Assets.Colors.accent, secondary: Assets.Colors.primary),
                                                     textColors: BarChartColors(primary: .white, secondary: .blue),
                                                     data: data))
            .background(Color.black)
    }
}
#endif

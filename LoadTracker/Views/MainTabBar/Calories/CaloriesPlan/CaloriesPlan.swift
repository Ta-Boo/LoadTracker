//
//  CaloriesPlan.swift
//  LoadTracker
//
//  Created by hladek on 20/09/2020.
//

import SwiftUI
import Alamofire

// MARK: Veiws builder

//enum ConstructableView: {
//    case workoutPlan
//    case caloriesPlan
//    case dietPlan
//}

//struct ViewHolder<Value: View> {
//    let value: Value
//}
extension CaloriesPlan {
    
    private enum ButtonStyle {
        case short, double, long
    }
    
    private func generateButon<ViewHolder: View>(style: ButtonStyle = .short,
                                           using g : GeometryProxy,
                                           presenting viewToPresent: ViewHolder,
                                           text: String = "",
                                           systemImage: String,
                                           perform action: @escaping () -> Void)  -> some View {
        var width, height, fontSize : CGFloat
        var color: Color
        var spacer: Bool
        switch style {
        case .short:
            width = g.size.width * 1/2.3
            height = g.size.height * 1/9.9
            color = Assets.Colors.accent
            fontSize = 28
            spacer = true
        case .double:
            width = g.size.width * 1/2.3
            height = g.size.height * 2/9.2
            color = Assets.Colors.secondary
            spacer = false
            fontSize = 64
        case .long:
            width = g.size.width * 0.9
            height = g.size.height * 1/9
            color = Assets.Colors.secondary
            fontSize = 28
            spacer = false
        }
        
        let radius = min(width,height) / 3
        let button = Button(action: {
            action()
        }) {
            HStack {
                Image(systemName: systemImage)
                    .font(.system(size: fontSize))
                Text(text)
                if spacer {
                    Spacer()
                }
            }
        }
        .foregroundColor(Assets.Colors.text)
        .sheet(isPresented: $showingDetail) {
            switch style {
            case .short:
                DietPlan()
            case .double:
                FoodListView()
            case .long:
                WorkoutPlan()
            }
            
        }
        .padding()
        .frame(width: width , height: height)
        .background(color)
        .cornerRadius(radius)
        return button
    }
}

struct CaloriesPlan: View {
    @State var sliderValue: Double = 0
    @State  var loaded = false
    @State var showingDetail = false
    let viewModel = CaloriesPlanViewModel()
    
    
    private var charView: BarChartView {
        BarChartView(dataWrapper: BarCharDataWrapper(title: "Calories Income",
                                                     bacgroundColors: BarChartColors(primary: .clear, secondary:Assets.Colors.accent.opacity(0.4)),
                                                     chartsColors: BarChartColors(primary: Assets.Colors.secondary, secondary: Assets.Colors.primary),
                                                     textColors: BarChartColors(primary: Assets.Colors.text, secondary: Assets.Colors.text),
                                                     data: viewModel.data))
    }
    
    var body: some View {
        ZStack {
            Color("Primary")
            GeometryReader { geometry in
                VStack {
                    Spacer().frame(height: geometry.size.height * (1/20))
                        charView
                            .frame(height: geometry.size.height * (2/5))
                    Spacer()
                    VStack {
                        Text("\(viewModel.data.map{$0.value}.reduce(0, +))")
                            .foregroundColor(Assets.Colors.text)
                            .font(.system(size: 60))
                        + Text("Kcal")
                            .foregroundColor(Assets.Colors.text)
                            .font(.system(size: 26))
                        Text("*calorie intake durring the last week")
                            .foregroundColor(Assets.Colors.text)

                    }
                    VStack {
                        let buttonHeight = g.size.height * 1/9.9

                        generateButon(style: .long,
                                      using: geometry,
                                      presenting: WorkoutPlan(),
                                      text: "Show history",
                                      systemImage: "clock.fill") {
                            self.showingDetail.toggle()
                        }
                        HStack {
                            VStack {
                                generateButon(style: .short,
                                              using: geometry,
                                              presenting: WorkoutPlan(),
                                              text: "Personalize",
                                              systemImage: "person.crop.circle") {
                                    self.showingDetail.toggle()
                                }
                                Spacer().frame(height: 10)
                                generateButon(style: .short,
                                              using: geometry,
                                              presenting: WorkoutPlan(),
                                              text: "Recipes",
                                              systemImage: "plus.circle") {
                                    self.showingDetail.toggle()
                                }
                            }
                            Spacer()
                            generateButon(style: .double,
                                          using: geometry,
                                          presenting: WorkoutPlan(),
                                          systemImage: "magnifyingglass") {
                                self.showingDetail.toggle()
                            }
                            Spacer()
                        }
                        .padding([.bottom, .horizontal])
                    }
                }
            }
        }
    }
    
}
#if DEBUG
struct CaloriesPlan_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CaloriesPlan()
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
            
            CaloriesPlan()
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewDisplayName("iPhone XS Max")
        }
    }
}
#endif

//
//  BarChartView.swift
//  LoadTracker
//
//  Created by hladek on 24/09/2020.
//

import SwiftUI

struct BarChartData {
    let name: String
    let value: Int
}

struct BarChartView: View {
    @Binding var data: [BarChartData]
    var body: some View {
        GeometryReader { geometry in
            
            LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.005), Color.white.opacity(0.8)]), startPoint: .top, endPoint: .bottom)
                .mask(RoundedRectangle(cornerRadius: 25))
                .padding()
            VStack {
                Spacer()
                HStack{
                    Spacer()
                    Text("Title")
                        .font(.title2)
                        .foregroundColor(.white)
                    Spacer()
                }
                HStack{
                    VStack{
                        ForEach(1..<4){_ in
                            Text("\(Int.random(in: 1000...2500))").font(.system(size: 10))
                                .lineLimit(1)
                                .rotationEffect(.degrees(-45))
                            //                                            .padding(2)
                            Spacer()
                        }
                    }
                    Spacer()
                    ForEach(1..<7) { i in
                        VStack {
                            Spacer()
                            LinearGradient(gradient: Gradient(colors: [Assets.Colors.accent, Assets.Colors.primary]), startPoint: .top, endPoint: .bottom)
                                .mask(RoundedRectangle(cornerRadius: 14))
                                .frame(height: geometry.size.height * 0.6)//(loaded ? CGFloat.random(in: 0.2...0.6) : 0.05))
                                .animation(.interpolatingSpring(stiffness: 10, damping: 10))
                            Text("21.9")
                                .padding(.horizontal, 5)
                                .font(.system(size: 12))
                                .lineLimit(1)
                        }
                        Spacer()
                    }
                }.padding()
                Spacer().frame(height:geometry.size.height * 0.05)
                
            }
            
        }
        .frame(height: 300)    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView().background(Color.black)
    }
}

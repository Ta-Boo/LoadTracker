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

    var body: some View {
        ZStack {
            Color("Primary")
            VStack{
                Spacer().frame(height: 30)
                ZStack {

                }
                Button("Tap Me") {
                    self.loaded.toggle()
                }
                .animation(nil)
                .foregroundColor(.white)
                .animation(.interpolatingSpring(stiffness: 10, damping: 1))
                Spacer()
            }
        }
    }
    
    init() {
        //        Session.foodApiRequest(querry: "Cheddar")
    }
}

struct CaloriesPlan_Previews: PreviewProvider {
    static var previews: some View {
        CaloriesPlan()
    }
}

//
//  SwiftUIView.swift
//  LoadTracker
//
//  Created by hladek on 30/09/2020.
//

import SwiftUI
import Alamofire


struct FoodRow: View {
    var food: FoodModel

    var body: some View {
        Text("Come and eat at \(food.name)")
    }
}

struct FoodListView: View {
    @State var listOfFood: [FoodModel] = []
    @ObservedObject var viewModel = FoodListviewModel()
    
//    init() {
//        viewModel =  FoodListviewModel(foodList: listOfFood)
//    }
    

    var body: some View {
        ZStack {
            Assets.Colors.another
            List(viewModel.listOfFood) { foodModel in
                Text( foodModel.name)
            }
        }.onAppear {
            viewModel.fetchFood(name: "cheddar")
        }
    }
}

//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        FoodListView()
//    }
//}

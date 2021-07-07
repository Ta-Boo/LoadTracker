//
//  FoodDetailView.swift
//  LoadTracker
//
//  Created by hladek on 05/07/2021.
//

import SwiftUI

struct FoodDetailView: View {
    let viewModel: FoodDetailViewModel
    var body: some View {
        ForEach(viewModel.food.nutrients.filter{
            let match = Nutrients(rawValue: $0.id)
            if match == nil {
                return false
            } else {
                print($0.id)
                return true
            }

        }, id: \.self) { nutrient in
            Text(nutrient.name ?? "??")
            let string = nutrient.value ?? 0
            Text("\(string)")
            Text(nutrient.unit)
            Text("-------")
        }
    }
}

struct FoodDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FoodDetailView(
            viewModel: FoodDetailViewModel(
                food: FoodModel(id: 123,
                                type: "IDK",
                                name: "Banana",
                                brandName: "who knows",
                                nutrients: [
                                    FoodNutrientsModel(id: "1", name: "Proteins", unit: "g", value: 123),
                                    FoodNutrientsModel(id: "2", name: "Proteins", unit: "g", value: 123),
                                    FoodNutrientsModel(id: "3", name: "Proteins", unit: "g", value: 123)
                                ]
                )
            )
        )
    }
}

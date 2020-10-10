//
//  FoodListViewModel.swift
//  LoadTracker
//
//  Created by hladek on 30/09/2020.
//

import Foundation
import Alamofire
import SwiftUI

class FoodListviewModel: ObservableObject {
    @Published var listOfFood: [FoodModel] = []
    
//    init(foodList: Published<[FoodModel]>) {
//        self._listOfFood = foodList
//    }
//
    
    func fetchFood(name: String) {
        Session.foodApiRequest(querry: name) { [weak self] result in
            guard let result = result.value  else {
                return
            }
            self?.listOfFood = result.foodList
        }
    }
    
}

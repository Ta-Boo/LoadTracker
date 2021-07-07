//
//  FoodListViewModel.swift
//  LoadTracker
//
//  Created by hladek on 30/09/2020.
//

import Foundation
import Alamofire
import SwiftUI

class FoodDetailViewModel: ObservableObject {
    var food: FoodModel


    init(food: FoodModel) {
        self.food = food
    }

}

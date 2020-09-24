//
//  FoodModel.swift
//  LoadTracker
//
//  Created by hladek on 23/09/2020.
//

import Foundation

struct FoodContainerModel: Codable {
    let totalPages: Int
    let foodList: [FoodModel]
    
    enum CodingKeys: String, CodingKey {
        case foodList = "foods"
        case totalPages
    }
}


struct FoodModel: Codable {
    let type: String
    let name : String
    let nutrients: [FoodNutrientsModel]

    enum CodingKeys: String, CodingKey {
        case type = "dataType"
        case name = "description"
        case nutrients = "foodNutrients"
    }
}

struct FoodNutrientsModel: Codable {
    let name : String?
    let unit : String
    let value: Int?
    
    enum CodingKeys: String, CodingKey {
        case name
        case unit = "unitName"
        case value = "number"
    }

}

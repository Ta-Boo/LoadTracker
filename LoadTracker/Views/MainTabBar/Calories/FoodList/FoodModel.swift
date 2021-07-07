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


struct FoodModel: Codable, Identifiable {
    let id: Int
    let type: String
    let name : String
    let brandName: String?
    let nutrients: [FoodNutrientsModel]

    enum CodingKeys: String, CodingKey {
        case id = "fdcId"
        case type = "dataType"
        case name = "description"
        case nutrients = "foodNutrients"
        case brandName
    }
}

struct FoodNutrientsModel: Codable, Hashable {
    let id: String
    let name : String?
    let unit : String
    let value: Double?

    enum CodingKeys: String, CodingKey {
        case id = "nutrientNumber"
        case name = "nutrientName"
        case unit = "unitName"
        case value = "value"
    }
}

enum Nutrients: String, CaseIterable {
    case proteins = "203"
    case lipids = "204"
    case carbohydrates = "205"
    case sugars = "269"
    case calories = "208"
}

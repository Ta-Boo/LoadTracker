//
//  FoodListViewModel.swift
//  LoadTracker
//
//  Created by hladek on 30/09/2020.
//

import Foundation
import Alamofire
import SwiftUI
import Combine

class FoodListviewModel: ObservableObject {
    @Published var listOfFood: [FoodModel] = []
    @Published var loading = false
    @Published var query = ""

    var subscription: Set<AnyCancellable> = []

    init() {
        $query
            .debounce(for: .milliseconds(750), scheduler: RunLoop.main)
            .removeDuplicates()
            .map { [weak self] value -> String? in
                if value.count < 1 {
                    self?.listOfFood = []
                    return nil
                }
                return value
            }
            .compactMap{ $0 }
            .sink { [weak self] queryValue in
                self?.fetchFood(name: queryValue)
            }
            .store(in: &subscription)
    }

    private func fetchFood(name: String) {
        loading = true
        Session.fetchFood(query: name) { [weak self] result in
            guard let result = result.value  else {
                self?.loading = false
                return
            }
            self?.listOfFood = result.foodList
            self?.loading = false
        }

    }
}

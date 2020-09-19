//
//  OnBoardingViewModel.swift
//  LoadTracker
//
//  Created by hladek on 19/09/2020.
//

import Foundation


struct OnboardingTabModel: Identifiable {
    var id: Int
    let title,image: String
}

class OnboardingViewModel: ObservableObject, ViewModel {
    @Published var data: [OnboardingTabModel] = [
        OnboardingTabModel(id: 0, title: "Create your own workout plan now!", image: .mountain ),
        OnboardingTabModel(id: 1, title: "Create your own workout plan now!1", image: .mountain ),
        OnboardingTabModel(id: 1, title: "Create your own workout plan now!2", image: .bull ),
    ]
}

let data = [
    OnboardingTabModel(id: 0, title: "Create your own workout plan now!", image: .mountain ),
    OnboardingTabModel(id: 1, title: "Create your own workout plan now!1", image: .mountain ),
    OnboardingTabModel(id: 1, title: "Create your own workout plan now!2", image: .bull ),
]

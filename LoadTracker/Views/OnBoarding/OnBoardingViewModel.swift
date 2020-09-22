//
//  OnBoardingViewModel.swift
//  LoadTracker
//
//  Created by hladek on 19/09/2020.
//

import Foundation
import SwiftUI


struct OnboardingTabModel: Identifiable {
    var id: Int
    let title: String
    let image: Image
}

class OnboardingViewModel: ObservableObject, ViewModel {
    @Published var data: [OnboardingTabModel] = [
        OnboardingTabModel(id: 0, title: "Create your own diet plan.", image: Assets.Icons.onboardingDiet),
        OnboardingTabModel(id: 1, title: "Track calories income.", image: Assets.Icons.onboardingCalories),
        OnboardingTabModel(id: 2, title: "Save your training progress.", image: Assets.Icons.onboardingFit),
    ]
}

    

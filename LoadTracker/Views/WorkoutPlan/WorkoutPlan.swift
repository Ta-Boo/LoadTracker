//
//  WorkoutPlan.swift
//  LoadTracker
//
//  Created by hladek on 20/09/2020.
//

import SwiftUI

struct WorkoutPlan: View {
    var body: some View {
        ZStack {
            Assets.Colors.primary
            Text("Hello, WorkoutPlan!")
        }
        .edgesIgnoringSafeArea(.vertical)
    }
}

struct WorkoutPlan_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutPlan()
    }
}

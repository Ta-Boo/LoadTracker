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
            Color("Primary")
            Text("Hello, WorkoutPlan!")
        }.background(Color("Primary"))
        .edgesIgnoringSafeArea(.top)
    }
}

struct WorkoutPlan_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutPlan()
    }
}

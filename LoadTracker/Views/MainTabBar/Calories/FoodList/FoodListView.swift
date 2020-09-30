//
//  SwiftUIView.swift
//  LoadTracker
//
//  Created by hladek on 30/09/2020.
//

import SwiftUI

struct FoodListView: View {
    var body: some View {
        ZStack {
            Assets.Colors.another
            Text("here comes food list")
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        FoodListView()
    }
}

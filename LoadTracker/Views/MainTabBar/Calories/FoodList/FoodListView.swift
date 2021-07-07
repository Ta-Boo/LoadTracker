//
//  SwiftUIView.swift
//  LoadTracker
//
//  Created by hladek on 30/09/2020.
//

import SwiftUI
import Alamofire


struct FoodRow: View {
    var food: FoodModel

    var body: some View {
        Text("Come and eat at \(food.name)")
    }
}

struct FoodListView: View {
    @State var listOfFood: [FoodModel] = []
    @ObservedObject var viewModel = FoodListviewModel()

    let baseColor = Assets.Colors.secondary
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().backgroundColor = .clear
        UITableView.appearance().backgroundColor = .clear
    }
    

    var body: some View {
        //        LoadingView(isShowing: $viewModel.loading) {

        NavigationView {
            ZStack(alignment: .center) {
                baseColor.edgesIgnoringSafeArea(.vertical)
                VStack {
                    SearchBar(text: $viewModel.query, tint: Color.primary)
                    List(viewModel.listOfFood) { foodModel in

//                        ForEach(viewModel.listOfFood) { foodModel in
                            let title = "\(foodModel.name) - (\(foodModel.brandName ?? ""))"
                            NavigationLink(title, destination: FoodDetailView(viewModel: FoodDetailViewModel(food: foodModel)))
                                .listRowBackground(Color.clear)
//                        }
                    }

                }
                .navigationBarHidden(true)
                .edgesIgnoringSafeArea([.top, .bottom])
                .background(Color.clear)
                LoadingView(isShowing: $viewModel.loading)
            }
        }
        .background(Color.clear)

        //        }
    }

}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        FoodListView()
    }
}


struct LoadingView: View {

    @Binding var isShowing: Bool

    var body: some View {
        if isShowing {
            ActivityIndicator(isAnimating: .constant(true), style: .large)
        }

    }

}

struct ActivityIndicator: UIViewRepresentable {
    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(style: style)
        indicator.color = UIColor(Assets.Colors.text)
        return indicator
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}

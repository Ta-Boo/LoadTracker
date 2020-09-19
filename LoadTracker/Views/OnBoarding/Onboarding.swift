import SwiftUI


struct Onboarding: View {
    
    @ObservedObject var viewModel: OnboardingViewModel
    var body: some View {
        NavigationView {
            VStack {
                TabView {
                    ForEach(data) { page in
                        generatePage(data: page)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))

                Spacer()
            }
        }

    }
    
    func generatePage(data page: OnboardingTabModel) -> some View {
        GeometryReader { g in
            VStack {
                Image(page.image)
                    .resizable()
                    .scaledToFit()
                Text(page.title)
                    .font(.title).bold()
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 20)
            }
        }
    }
    
    
    init(viewModel: OnboardingViewModel) {
        self.viewModel = viewModel
        UIPageControl.appearance().currentPageIndicatorTintColor = .red
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding(viewModel: OnboardingViewModel())
    }
}


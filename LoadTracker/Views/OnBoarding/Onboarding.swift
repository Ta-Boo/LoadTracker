import SwiftUI

struct StartingView : View {
    var body: some View {
        if AppCache.showOnboarding {
            Onboarding()
        } else {
            MainTabBarView()
        }
    }
}

struct Onboarding: View {
    
    @ObservedObject var viewModel: OnboardingViewModel
    var body: some View {
        NavigationView {
            VStack {
                TabView {
                    ForEach(viewModel.data) { page in
                        generatePage(data: page)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            }
            .navigationBarHidden(true)
            .background(Assets.Colors.primary)
            .edgesIgnoringSafeArea(.vertical)
            
        }
    }
    
    func generatePage(data page: OnboardingTabModel) -> some View {
        GeometryReader { geometry in
            ZStack{
                if page.id == viewModel.data.map{$0.id}.max() {
                    VStack {
                        HStack{
                            Spacer()
                            NavigationLink(
                                destination: MainTabBarView()
                                    .background(Assets.Colors.primary)
                                    .edgesIgnoringSafeArea(.vertical)
                                    .navigationBarBackButtonHidden(true)
                                    .navigationBarHidden(true)) {
                                Image(systemName: "xmark.circle.fill")
                                    .font(.largeTitle)
                                    .foregroundColor(Assets.Colors.secondary)
                                    .padding()
                            }
                            
                        }
                        
                        Spacer()
                    }.onTapGesture {
                        AppCache.showOnboarding = false
                    }
                }
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        ZStack {
                            Assets.Icons.onboardingBackground
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.pink)
                                .padding(geometry.size.width * 0.025)
                            page.image
                                .resizable()
                                .scaledToFit()
                                .padding(geometry.size.width * 0.1)
                            
                        }
                        Spacer()
                    }
                    Spacer()
                    Text(page.title)
                        .font(.headline).bold()
                        .foregroundColor(Assets.Colors.text)
                        .padding(.horizontal, 10)
                        .padding(.bottom, 32)
                    if page.id == viewModel.data.map{$0.id}.max(){
                        NavigationLink(
                            destination: MainTabBarView()
                                .navigationBarBackButtonHidden(true)
                                .navigationBarHidden(true)
                                .background(Assets.Colors.primary)
                            
                        ) {
                            Text("Start")
                                .font(.headline)
                                .frame(width: 300, height: 50, alignment: .center)
                                .foregroundColor(Assets.Colors.text)
                                .background(Assets.Colors.secondary)
                                .cornerRadius(25)
                                .padding(.bottom,15)
                        }
                    }
                    Spacer()
                }
                .opacity(Double(geometry.frame(in : .global).minX)/200+1)
            }
        }
    }
    
    func showCloseButtonIfLast(id: Int) {
        
    }
    
    init() {
        self.viewModel = OnboardingViewModel()
        UIPageControl.appearance().currentPageIndicatorTintColor = .red
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}


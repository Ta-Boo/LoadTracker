import SwiftUI

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
                .edgesIgnoringSafeArea(.top)
            }
            .navigationBarHidden(true)
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
                                destination: MainTabBarView().navigationBarBackButtonHidden(true).navigationBarHidden(true),
                                label: {
                                    Image(systemName: "xmark.circle.fill")
                                        .font(.largeTitle)
                                        .foregroundColor(.pink)
                                        .padding()
                                })
                        }
                        Spacer()
                    }
                }
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        ZStack {
                            Image(String.Icons.onboardingBackground)
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.pink)
                                .padding(geometry.size.width * 0.025)
                            Image(page.image)
                                .resizable()
                                .scaledToFit()
                                .padding(geometry.size.width * 0.1)
                            
                        }
                        Spacer()
                    }
                    Spacer()
                    Text(page.title)
                        .font(.headline).bold()
                        .foregroundColor(.gray)
                        .padding(.horizontal, 10)
                        .padding(.bottom, 32)
                    if page.id == viewModel.data.map{$0.id}.max(){
                        NavigationLink(
                            destination: MainTabBarView()
                                .navigationBarBackButtonHidden(true)
                                .navigationBarHidden(true)
                                .background(Color(String.Colors.primary)),
                            label: {
                                Text("Start")
                                    .font(.headline)
                                    .frame(width: 300, height: 50, alignment: .center)
                                    .foregroundColor(.white)
                                    .background(Color(#colorLiteral(red: 0.9580881, green: 0.10593573, blue: 0.3403331637, alpha: 1)))
                                    .cornerRadius(25)
                                    .padding(.bottom, 15)
                            })
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


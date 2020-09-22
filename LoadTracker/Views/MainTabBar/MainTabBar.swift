import SwiftUI

  struct ContentView: View {
      var body: some View {
          Home()
            .ignoresSafeArea(.all, edges: .bottom)
      }
  }
  
  struct ContentView_Previews: PreviewProvider {
      static var previews: some View {
          Home()
      }
  }
  
  struct Home : View {
      
      @State var index = 0
      @State var curvePos : CGFloat = 0
      
      var body: some View{
        switch index {
        case 0:
            WorkoutPlan()
        case 1 :
            CaloriesPlan()
        default:
            WorkoutPlan()
        }
        Spacer()
          ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
              HStack{
//                  GeometryReader{g in
//                      VStack{
//                          Button(action: {
//                              withAnimation(.spring()){
//                                  index = 0
//                                  self.curvePos = g.frame(in: .global).midX
//                              }
//
//                          }, label: {
//
//                            Image(systemName: "waveform.path.ecg")
//                                  .renderingMode(.template)
//                                  .resizable()
//                                  .foregroundColor(index == 0 ? .black : .white)
//                                  .frame(width: 28, height: 28)
//                                  .padding(.all, 15)
//                              // animating View...
//                                  .background(Color.pink.opacity(index == 0 ? 1 : 0).clipShape(Circle()))
//                                  .offset(y: index == 0 ? -35 : 0)
//                          })
//                      }
//                      // 28 + padding 15 = 43....
//                      .frame(width: 43, height: 43)
//                      .onAppear {
//
//                          // getting initial index position...
//
//                          DispatchQueue.main.async {
//
//                              self.curvePos = g.frame(in: .global).midX
//                          }
//                      }
//                  }
//                  .frame(width: 43, height: 43)
//
//                  Spacer(minLength: 0)
                ForEach(0 ..< 3) { item in
                    
                    
                    
                    GeometryReader{g in
                        LoaderTabBarItemView()
//                                       Button(action: {
//                                           withAnimation(.spring()){
//                                               index = 0
//                                               self.curvePos = g.frame(in: .global).midX
//                                           }
//
//                                       }, label: {
//
//                                         Image(systemName: "waveform.path.ecg")
//                                               .renderingMode(.template)
//                                               .resizable()
//                                               .foregroundColor(index == 0 ? .black : .white)
//                                               .frame(width: 28, height: 28)
//                                               .padding(.all, 15)
//                                           // animating View...
//                                               .background(Color.pink.opacity(index == 0 ? 1 : 0).clipShape(Circle()))
//                                               .offset(y: index == 0 ? -35 : 0)
//                                       })
                                   // 28 + padding 15 = 43....
                                   .frame(width: 43, height: 43)
                                   .onAppear {
                                       DispatchQueue.main.async {
                                           self.curvePos = g.frame(in: .global).midX
                                       }
                                   }
                               }
                               .frame(width: 43, height: 43)
                    Spacer(minLength: 0)
                }
//                  GeometryReader{g in
//                      VStack{
//                          Button(action: {
//                              withAnimation(.spring()){
//                                  index = 1
//                                  // assigning it whenever its button is clicked...
//                                  self.curvePos = g.frame(in: .global).midX
//                              }
//
//                          }, label: {
//
//                            Image(systemName: "calendar")
//                                  .renderingMode(.template)
//                                  .resizable()
//                                  .foregroundColor(index == 1 ? .black : .gray)
//                                  .frame(width: 28, height: 28)
//                                  .padding(.all, 15)
//                                  .background(Color.pink.opacity(index == 1 ? 1 : 0).clipShape(Circle()))
//                                  .offset(y: index == 1 ? -35 : 0)
//                          })
//                      }
//                      // 28 + padding 15 = 43....
//                      .frame(width: 43, height: 43)
//                  }
//                  .frame(width: 43, height: 43)
//
//                  Spacer(minLength: 0)
                  
//                  GeometryReader{g in
//
//                      VStack{
//
//                          Button(action: {
//
//                              withAnimation(.spring()){
//
//                                  index = 2
//                                  self.curvePos = g.frame(in: .global).midX
//                              }
//
//                          }, label: {
//
//                            Image(systemName: "flame")
//                                  .renderingMode(.template)
//                                  .resizable()
//                                  .foregroundColor(index == 2 ? .black : .gray)
//                                  .frame(width: 28, height: 28)
//                                  .padding(.all, 15)
//                                  .background(Color.pink.opacity(index == 2 ? 1 : 0).clipShape(Circle()))
//                                  .offset(y: index == 2 ? -35 : 0)
//                          })
//                      }
//                      // 28 + padding 15 = 43....
//                      .frame(width: 43, height: 43)
//                  }
//                  .frame(width: 43, height: 43)
              }
              .padding(.horizontal, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 25 : 35)
              .padding(.vertical, 8)
              .background(Color.pink.clipShape(CShape(curvePos: curvePos)))
          })
          .edgesIgnoringSafeArea(.all)
      }
  }


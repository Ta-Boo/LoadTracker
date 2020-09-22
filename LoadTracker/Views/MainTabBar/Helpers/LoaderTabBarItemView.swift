import SwiftUI

struct LoaderTabBarItemView: View {
    @State var color = Color.white
    @State var offset : CGFloat = 0
    @State var opacity : Double = 1
    var body: some View {
            VStack{
                Button(action: {
                    withAnimation(.spring()){
//                        index = 0
//                        self.curvePos = g.frame(in: .global).midX
                    }
                    
                }, label: {
                    
                  Image(systemName: "waveform.path.ecg")
                        .renderingMode(.template)
                        .resizable()
                        .foregroundColor(color)
                        .frame(width: 28, height: 28)
                        .padding(.all, 15)
                        .background(Color.pink.opacity(opacity).clipShape(Circle()))
                        .offset(y: offset)
                })
            }
            .frame(width: 43, height: 43)
        }
    }
    

struct LoaderTabBarItemView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderTabBarItemView()
    }
}

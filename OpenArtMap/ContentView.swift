import SwiftUI

struct Ball: View {

    let color: Color

    var body: some View {
        color
            .clipShape(Circle())
            .frame(width: 200, height: 200, alignment: .center)
    }
}

struct ContentView: View {

    @State var redBallIsShown: Bool = true

    var body: some View {
        VStack {
            Toggle(isOn: $redBallIsShown.animation()) {
                Text("Toggle red ball.")
            }.padding()
            Ball(color: .yellow)
            if redBallIsShown {
                Ball(color: .red)
            }
            ZStack {
                Ball(color: .blue)
                Text("Hello, Elias and Mark!")
            }.padding(.all, 24)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

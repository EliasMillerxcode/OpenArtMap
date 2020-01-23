import SwiftUI

struct Ball: View {

    let color: Color

    @Binding var diameter: CGFloat

    var body: some View {
        color
            .clipShape(Circle())
            .frame(width: diameter, height: diameter, alignment: .center)
    }
}

struct ContentView: View {

    @State var toggleColor: Bool = true
    @State var size: CGFloat = 10
    
    var color: Color{ Color(red: Double(CGFloat.random(in: 0...1)), green: Double(CGFloat.random(in: 0...1)), blue: Double(CGFloat.random(in: 0...1)))}
    var colors: [Color]{
        [.blue, .green, .orange]
    }
    var body: some View {
        VStack {
            Ball(
                color: toggleColor ? colors[Int(arc4random_uniform(2))] : color,
                diameter: $size
            ).frame(width: 300, height: 300, alignment: .center)
            Toggle(isOn: $toggleColor.animation()) {
                Text("Toggle red ball.")
            }.padding()
            Slider(value: $size, in: 10...350)
                .padding()

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

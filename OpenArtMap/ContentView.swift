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

    var body: some View {
        VStack {
            Toggle(isOn: $toggleColor.animation()) {
                Text("Toggle red ball.")
            }.padding()
            Slider(value: $size, in: 10...100)
                .padding()
            Ball(
                color: toggleColor ? .yellow : .blue,
                diameter: $size
            ).frame(width: 200, height: 200, alignment: .center)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

import SwiftUI
import CoreLocation

class ArtworkStore: ObservableObject {
    @Published var artworks: [Artwork] = [
        Artwork(name: "Bismark Denkmal", description: "Dies ist berühtes Denkmahl das Bismark darstellt", coordinate: CLLocationCoordinate2D(latitude: 51.951718, longitude: 9.740112), kind: .sculpture, bestImage: UIImage(named: "Bismark")!),
        Artwork(name: "Benksy", description: "Dies ist Graffiti", coordinate: CLLocationCoordinate2D(latitude: 59.11, longitude: 10.264), kind: .sculpture, bestImage: UIImage(named: "Benksy1")!),
        Artwork(name: "Elbphilharmonie", description: "Dies ist Graffiti", coordinate: CLLocationCoordinate2D(latitude: 59.11, longitude: 50.234), kind: .sculpture, bestImage: UIImage(named: "Elbphilharmonie")!)
    ]
}

struct ArtworksList: View {

    @ObservedObject var artworkStore: ArtworkStore

    var body: some View {
        List {
            ForEach(artworkStore.artworks) { artwork in
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(artwork.name)
                            .font(.headline)
                        Text(artwork.kind.name)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Image(uiImage: artwork.bestImage)
                        .resizable()
                        .frame(maxWidth: 60, maxHeight: 60)
                }
            }
        }
    }
}


struct ContentView: View {

    let artworkStore = ArtworkStore()

    var body: some View {
        TabView {
            MapView()
                .edgesIgnoringSafeArea(.all)
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Map")
            }
            ArtworksList(artworkStore: artworkStore)
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Artworks")
            }
        }
        .font(.headline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



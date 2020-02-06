import MapKit

class ArtAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var artwork: Artwork
    
    var title: String?
    var subtitle: String?
    
    init(artwork: Artwork) {
        self.coordinate = artwork.coordinate
        self.artwork = artwork
        self.title = artwork.name
        self.subtitle = artwork.kind.name
    }
    
}

import MapKit

struct Artwork: Identifiable {
    
    enum Kind {
        case painting
        case sculpture
        case graffiti
        case art_gallery
        
        var name: String {
            switch self {
            case .painting:
                return "Painting"
            case .sculpture:
                return "Sculpture"
            case .graffiti:
                return "Graffiti"
            case .art_gallery:
                return "art gallery"
            }
        }
    }

    let id: UUID = UUID()
    let name: String
    let description: String
    let coordinate: CLLocationCoordinate2D
    let kind: Kind
    let like: Bool
    let images: [UIImage]
    let bestImage: UIImage
    
    init(name: String, description: String = "", coordinate: CLLocationCoordinate2D, kind: Kind, like: Bool = false, bestImage: UIImage = UIImage() , images: [UIImage] = []) {
        self.name = name
        self.description = description
        self.coordinate = coordinate
        self.kind = kind
        self.like = like
        self.images = images
        self.bestImage = bestImage
    }
}

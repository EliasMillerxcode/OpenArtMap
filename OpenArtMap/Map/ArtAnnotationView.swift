import MapKit

class ArtAnnotationView: MKAnnotationView {
    init(artAnnotation: ArtAnnotation) {
        super.init(annotation: artAnnotation, reuseIdentifier: nil)
        
        self.image = artAnnotation.artwork.bestimage
        var width = artAnnotation.artwork.bestimage.size.width/10
        var height = artAnnotation.artwork.bestimage.size.height/10
        while width > 44{
            width = width/1.1
        }
        while height > 44{
            height = height/1.1
        }
        self.frame = CGRect(origin: .zero, size: CGSize(width: width, height: height))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIImage {
    func sizeToFit(_ edgeLenght: CGFloat) -> CGSize {
        let longestEdge = max(size.width, size.height)
        
    }
}

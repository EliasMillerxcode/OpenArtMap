import MapKit

class ArtAnnotationView: MKAnnotationView {
    init(artAnnotation: ArtAnnotation) {
        super.init(annotation: artAnnotation, reuseIdentifier: nil)

        let image = artAnnotation.artwork.bestImage
        self.image = image
        self.frame = CGRect(origin: .zero, size: image.sizeToFit(maxWidth: 64, maxHeight: 64))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIImage {
    func sizeToFit(maxWidth: CGFloat, maxHeight: CGFloat) -> CGSize {
        let isPotrait = size.height > size.width
        let scale: CGFloat
        if isPotrait {
            scale = maxHeight / size.height
        } else {
            scale = maxWidth / size.width
        }

        return CGSize(width: size.width * scale, height: size.height * scale)
    }
}

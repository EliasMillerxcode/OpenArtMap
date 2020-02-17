import MapKit

class ArtAnnotationView: MKAnnotationView {
    init(artAnnotation: ArtAnnotation) {
        super.init(annotation: artAnnotation, reuseIdentifier: nil)
        
        self.image = artAnnotation.artwork.bestimage
        var width = artAnnotation.artwork.bestimage.size.width
        var height = artAnnotation.artwork.bestimage.size.height
        var w: Bool? //true=Breite größer, false=Höhe größer, nil=Beide gleich groß
        var g: CGFloat = 0
        if width > height{
            g = width/height
            w = true
        }else if height > width{
            g = height/width
            w = false
        }
        width = 55
        height = 55
        if w == true{
            height = height/g
        }else if w == false{
            width = width/g
        }else{}
        self.frame = CGRect(origin: .zero, size: CGSize(width: width, height: height))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




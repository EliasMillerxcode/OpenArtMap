import MapKit

class ArtAnnotationView: MKAnnotationView {
    init(artAnnotation: ArtAnnotation) {
        super.init(annotation: artAnnotation, reuseIdentifier: nil)
        
        self.image = artAnnotation.artwork.bestimage
        var width = artAnnotation.artwork.bestimage.size.width
        var height = artAnnotation.artwork.bestimage.size.height
        var w = false
        var g: CGFloat = 0
        if width > height{
            g = width/height
            w = true
        }else if height > width{
            g = height/width
            w = false
        }
        while width > 55{
            width = width/1.1
        }
        while height > 55{
            height = height/1.1
        }
        if w == true{
            height = height/g
        }else{
            width = width/g
        }
        self.frame = CGRect(origin: .zero, size: CGSize(width: width, height: height))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




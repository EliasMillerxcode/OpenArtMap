//
//  MapView.swift
//  OpenArtMap
//
//  Created by Claudia Miller on 06.02.20.
//  Copyright © 2020 Miller Prodactions. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            print(mapView.centerCoordinate)
        }
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            guard let annotation = annotation as? ArtAnnotation else {
                return nil
            }
            return ArtAnnotationView(artAnnotation: annotation)
        }
    }
    
    func makeCoordinator() -> MapView.Coordinator {
        Coordinator(self)
    }
    
    
    
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        let mapview = MKMapView()
        mapview.delegate = context.coordinator
        
        let annotation = ArtAnnotation(artwork: Artwork(name: "Bismark Denkmal", description: "Dies ist berühtes Denkmahl das Bismark darstellt", coordinate: CLLocationCoordinate2D(latitude: 51.951718, longitude: 9.740112), kind: .sculpture, bestimage: UIImage(named: "Bismark")!))
        mapview.addAnnotation(annotation)
        return mapview
    }
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

//
//  MapView.swift
//  recetasIOS
//
//  Created by Zorayda Yadira Gutierrez Montes - Ceiba Software on 21/12/23.
//

import Foundation
import MapKit
import SwiftUI

class LocationMap: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}

struct MapView: UIViewRepresentable {
    let latitude: Double
    let longitude: Double
    let city: String
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        uiView.setCenter(coordinate, animated: true)
        
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        uiView.setRegion(region, animated: true)
        
        let location = LocationMap(title: city, coordinate: coordinate)
        uiView.addAnnotation(location)
    }
}


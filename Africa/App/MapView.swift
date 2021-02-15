//
//  MapView.swift
//  Africa
//
//  Created by Marcos Barbosa on 13/02/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    // MARK: - Properties
    
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    // MARK: - Body
    
    var body: some View {
       
        // MARK: - Basic map
        
//        Map(coordinateRegion: $region)
        
        // MARK: - Advanced map
        
        Map(coordinateRegion: $region, annotationItems: locations) { item in

            // (A) Pin: Old style (always static)
//            MapPin(coordinate: item.location, tint: .accentColor)

            // (B) Marker: New Style (always static)
//            MapMarker(coordinate: item.location, tint: .accentColor)
            
            // (C) Custom basic anotation (it could be interactive)
            MapAnnotation(coordinate: item.location) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32, alignment: .center)
            }//: Annotation
        }
    }
}

// MARK: - Preview

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

//
//  ContentView.swift
//  LearnMapKit
//
//  Created by Sri Vignesh on 15/8/20.
//

import SwiftUI
import MapKit

// Add Zoom controls
// Apply Map Rect

struct ContentView: View {
  
  @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D.init(latitude: 38.249260,
                                                                                     longitude:-122.583722),latitudinalMeters: 500, longitudinalMeters: 500)
  @State private var trackingMode = MapUserTrackingMode.none
  @State private var mapRect: MKMapRect = MKMapRect.init()
  
  
  let landmarkAnnotations:[LandmarkAnnotationItem] = [
    LandmarkAnnotationItem.init(type: .tee,
                                location: CLLocationCoordinate2D.init(latitude: 38.2468343570991, longitude:-122.586112529039)),
    LandmarkAnnotationItem.init(type: .water,
                                location: CLLocationCoordinate2D.init(latitude: 38.2482986450195, longitude:-122.585998535156)),
    LandmarkAnnotationItem.init(type: .sand,
                                location: CLLocationCoordinate2D.init(latitude: 38.250081657598, longitude:-122.585714980993)),
    LandmarkAnnotationItem.init(type: .sand,
                                location: CLLocationCoordinate2D.init(latitude: 38.2501039991472, longitude:-122.585543319616))]
  
  var body: some View {
          
    Map(coordinateRegion: $region,
        interactionModes: MapInteractionModes.all,
        showsUserLocation: true,
        userTrackingMode: $trackingMode,
        annotationItems: landmarkAnnotations) { landmark in
          MapAnnotation.init(coordinate: landmark.location) {
//            ZStack(alignment: .center) {
              Image(landmark.type.imageName)
//            }
          }
      }
    .edgesIgnoringSafeArea(.all)
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



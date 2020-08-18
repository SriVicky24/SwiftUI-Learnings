//
//  LandmarkAnnotationItem.swift
//  LearnMapKit
//
//  Created by Sri Vignesh on 15/8/20.
//

import Foundation
import CoreLocation

struct LandmarkAnnotationItem: Identifiable {
  let id = UUID()
  let type: LandmarkType
  let location: CLLocationCoordinate2D
  
  
  enum LandmarkType : String {
    case dogleg
    case hazard
    case green
    case sand
    case tee
    case water
    
    var imageName: String {
      switch self {
        case .dogleg:
          return "dogleg"
        case .hazard:
          return "hazard"
        case .green:
          return "green"
        case .water:
          return "water"
        case .sand:
          return "sand"
        case .tee:
          return "tee"
      }
    }
  }
}

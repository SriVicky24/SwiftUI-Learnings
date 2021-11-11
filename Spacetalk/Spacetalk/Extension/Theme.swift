//
//  Theme.swift
//  Spacetalk
//
//  Created by Sri Badrinath on 28/10/21.
//

import UIKit
import SwiftUI
  
struct Theme {
    struct Color { }
    struct Font { }
    struct LineHeight { }
    struct LetterSpacing { }
}

extension Theme.Color {
  
  static let PrimaryBrand = Color("PrimaryBrand")
  static let PrimaryBrand25 = Color("PrimaryBrand25")
  static let PrimaryBrand50 = Color("PrimaryBrand50")
  static let PrimaryBrand75 = Color("PrimaryBrand25")
  
  static let BlackDark = Color("BlackDark")
  
}

extension Theme.Font {
    
    static let Title = Font.custom("Plaax6Ney-36-Regular", size: 36.0)
    static let H1 = Font.custom("Plaax6Ney-36-Regular", size: 24.0)
    static let H2 = Font.custom("Plaax6Ney-36-Regular", size: 20.0)
    static let Label = Font.custom("Plaax6Ney-46-Bold", size: 16.0)
    static let H3 = Font.custom("Plaax6Ney-36-Regular", size: 16.0)
    
    static let P1 = Font.custom("Plaax6Ney-26-Light", size: 16.0)
    static let P2 = Font.custom("Plaax6Ney-36-Regular", size: 14.0)
    
}

extension Theme.LineHeight {
    static let Title: CGFloat = 44.0
    static let H1: CGFloat = 32.0
    static let H2: CGFloat = 28.0
    static let Label: CGFloat = 20.0
    static let H3: CGFloat = 20.0
    
    
    static let P1: CGFloat = 20.0
    static let P2: CGFloat = 19.0
}


extension Theme.LetterSpacing {
    static let Title: CGFloat = -1.0
    static let H1: CGFloat = 0.0
    static let H2: CGFloat = 0.0
    static let H3: CGFloat = 0.0
    static let Label: CGFloat = 0.0
    
    static let P1: CGFloat = 0.0
    static let P2: CGFloat = 0.0
}

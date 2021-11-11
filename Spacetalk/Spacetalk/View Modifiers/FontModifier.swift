//
//  FontModifier.swift
//  Spacetalk
//
//  Created by Sri Badrinath on 29/10/21.
//

import SwiftUI

enum FontStyle {
  case title,
       h1,
       h2,
       h3,
       label,
       p1,
       p2
  
  var font: Font {
    switch self {
      case .title: return Theme.Font.Title
      case .h1: return Theme.Font.H1
      case .h2: return Theme.Font.H2
      case .label: return Theme.Font.Label
      case .h3: return Theme.Font.H3
      case .p1: return Theme.Font.P1
      case .p2: return Theme.Font.P2
    }
  }
}


struct FontModifier: ViewModifier {
  
  var style: FontStyle  
  
  func body(content: Content) -> some View {
    content
      .font(style.font)
  }
}

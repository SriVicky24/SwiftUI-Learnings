//
//  View.swift
//  Spacetalk
//
//  Created by Sri Badrinath on 29/10/21.
//

import SwiftUI

extension View {
  func configureFont(withStyle style: FontStyle) -> some View {
    self.modifier(FontModifier(style: style))
  }
}

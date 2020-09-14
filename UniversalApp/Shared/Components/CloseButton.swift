//
//  CloseButton.swift
//  UniversalApp
//
//  Created by Sri Vignesh on 4/9/20.
//

import SwiftUI

struct CloseButton: View {
  var body: some View {
      Image(systemName: "xmark")
        .font(.system(size: 18, weight: .bold))
        .foregroundColor(.white)
        .padding(.all, 12)
        .background(Color.black.opacity(0.5))
        .clipShape(Circle())
  }
}

struct CloseButton_Previews: PreviewProvider {
    static var previews: some View {
        CloseButton()
    }
}

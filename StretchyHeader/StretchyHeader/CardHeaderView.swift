//
//  CardHeaderView.swift
//  StretchyHeader
//
//  Created by Sri Vignesh on 18/8/20.
//

import SwiftUI

struct CardHeaderView: View {
  var imageName: String
  var title: String
  var subTitle: String
  
  var body: some View {
    HStack(spacing: 12) {
      Image(imageName)
        .resizable()
        .frame(width: 50, height: 50)
        .cornerRadius(5.0)
      VStack(alignment: .leading, spacing: 6) {
        Text(title)
          .font(.headline)
          .fontWeight(.semibold)
        Text(subTitle)
          .font(.subheadline)
          .fontWeight(.regular)
      }
    }
    .padding(.vertical, 5)
    .padding(.horizontal, 12)
  }
}

struct CardHeaderView_Previews: PreviewProvider {
    static var previews: some View {
      CardHeaderView(imageName: "icHoleStat",
                     title: "Statistics",
                     subTitle: "18 Hole Course")
    }
}

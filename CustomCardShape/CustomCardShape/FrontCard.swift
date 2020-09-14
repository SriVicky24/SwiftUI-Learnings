//
//  FrontCard.swift
//  CustomCardShape
//
//  Created by Sri Vignesh on 12/9/20.
//

import SwiftUI

struct FrontCard: View {
    var body: some View {
      VStack (alignment: .leading, spacing: 8) {
        Image("logo")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 70, height: 70)
          .padding(.top, 8)
        Text("Adobe Creek GC")
          .font(.headline)
          .foregroundColor(Color.black.opacity(0.5))
        Spacer()
        HStack (alignment: .center) {
          HStack (spacing: 5) {
          Text("Name:")
            .font(.subheadline)
          Text("James Nicholas")
            .font(.subheadline)
            .foregroundColor(Color.gray.opacity(0.8))
        }
          Spacer()
          Text("2020")
            .font(.title3)
            .fontWeight(.semibold)
            .frame(maxHeight: .infinity)
            .foregroundColor(.green)
            .rotationEffect(Angle.init(degrees: 90))
        }
      }
      .padding(.horizontal, 8)
      .padding(.vertical, 8)
    }
}

struct FrontCard_Previews: PreviewProvider {
    static var previews: some View {
        FrontCard()
    }
}

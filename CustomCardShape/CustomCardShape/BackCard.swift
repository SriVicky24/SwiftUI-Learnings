//
//  BackCard.swift
//  CustomCardShape
//
//  Created by Sri Vignesh on 13/9/20.
//

import SwiftUI

struct BackCard: View {
    var body: some View {
      GeometryReader { g in
        VStack (alignment: .leading, spacing: 8) {
          HStack (spacing: 5) {
            Text("Scores:")
              .font(.subheadline)
            Text("65")
              .font(.subheadline)
              .foregroundColor(Color.gray.opacity(0.8))
          }
          HStack (spacing: 5) {
            Text("Effective Date:")
              .font(.subheadline)
            Text("2020-09-13")
              .font(.subheadline)
              .foregroundColor(Color.gray.opacity(0.8))
          }
          Text("Last 20 Scores - Marked with * is used for Handicap")
            .font(.caption)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(width: g.size.width)
            .background(Color.blue)
          // Score Grid
          LazyVGrid(columns: [GridItem(.fixed(40), spacing: 24), GridItem(.fixed(40), spacing: 24), GridItem(.fixed(40) , spacing: 24), GridItem(.fixed(40), spacing: 24), GridItem(.fixed(40))], alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/,
                    spacing: 12, content: {
                      ForEach(0..<20) { index in
                        Text("7.8")
                      }
          })
        }
      }
      .padding([.horizontal, .vertical], 8)
    }
}

struct BackCard_Previews: PreviewProvider {
    static var previews: some View {
        BackCard()
    }
}

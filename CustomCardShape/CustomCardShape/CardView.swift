//
//  CardView.swift
//  CustomCardShape
//
//  Created by Sri Vignesh on 13/9/20.
//

import SwiftUI

struct CardView: View {
  
  @State var isFlipped: Bool = false
  
  var body: some View {
    ZStack {
      if !isFlipped {
        Rectangle()
          .foregroundColor(.orange)
          .frame(width: 350, height: 200)
          .overlay(CloudShape()
                    .fill(Color.white)
                    .frame(width: 350, height: 200))
          .cornerRadius(8.0)
          .shadow(color: Color.black.opacity(0.4), radius: 5, x: 5, y: 5)
      FrontCard()
        .frame(width:350, height: 200, alignment: .leading)
      }
    else {
      BackCard()
        .overlay(RoundedRectangle(cornerRadius: 8, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                  .stroke(Color.orange, lineWidth: 2))
        .frame(width: 350, height: 200, alignment: .leading)
      }
    }
    .scaleEffect(x: isFlipped ? 1.0 : -1.0, y: 1.0)
    .rotation3DEffect(
      isFlipped ? .degrees(0) : .degrees(-180),
      axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/,
      anchor: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/,
      anchorZ: 1.0,
      perspective: 0.5)
    .animation(.spring())
    .onTapGesture(count: 1, perform: {
      withAnimation {
        isFlipped.toggle()
      }
    })
  }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}

struct CloudShape: Shape {
  func path(in rect: CGRect) -> Path {
    Path { path in
      path.move(to: CGPoint(x: 0, y: 0))
      path.addLine(to: CGPoint(x: rect.size.width / 6, y: 0))
      path.addQuadCurve(to: CGPoint(x: rect.size.width / 1.2,
                                    y: rect.size.height / 1.6),
                        control: CGPoint(x: rect.size.width - 100,
                                         y: 0))
      
      path.addQuadCurve(to: CGPoint(x: rect.size.width,
                                    y: rect.size.height / 1.2),
                        control: CGPoint(x: rect.size.width,
                                         y: 130))
      path.addLine(to: CGPoint(x: rect.size.width,
                               y: rect.size.height))
      path.addLine(to: CGPoint(x: 0, y: rect.size.height))
      
    }
  }
}

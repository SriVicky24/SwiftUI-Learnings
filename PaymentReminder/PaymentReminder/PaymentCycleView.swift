//
//  PaymentCycleView.swift
//  PaymentReminder
//
//  Created by Sri Vignesh on 12/8/20.
//

import SwiftUI

struct PaymentCycleView: View {
  
  var paymentDetails : PaymentDue
  var startDegree = -90.0
  var endDegree = -0.0
  
    var body: some View {
      ZStack {
        Circle()
          .stroke(Color.gray.opacity(0.5), lineWidth: 2)
          .frame(height: 230, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

        let payments = paymentDetails.payments

        ForEach(Array(zip(payments.indices, payments)), id: \.0) { index, payment in
          ArcShape(startAngle: startDegree + (Double(index * 90)),
                   endAngle: (endDegree + (Double(index * 90))))
              .fill(payment.status ? Color.green : Color.blue)
              .frame(width: 215, height: 215)
        }

        Circle()
          .stroke(Color.gray.opacity(0.5), lineWidth: 2)
          .frame(height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        VStack (spacing: 6){
          Text(paymentDetails.date)
          .font(.footnote)
          .fontWeight(.light)
          .foregroundColor(Color.black)
          .multilineTextAlignment(.center)
          .lineLimit(1)

          Text(paymentDetails.name)
          .font(.title3)
          .fontWeight(.semibold)
          .foregroundColor(Color.black)
          .multilineTextAlignment(.center)
          .lineLimit(1)
          Text(paymentDetails.amount)
          .font(.headline)
          .fontWeight(.semibold)
          .foregroundColor(Color.black)
          .multilineTextAlignment(.center)
          .lineLimit(1)

          if let balance = paymentDetails.balance {

            Divider()
              .frame(width: 50, height: 3, alignment: .center)
              .background(Color.orange)
              .padding(.vertical)
            Text("\(balance) Remaining")
              .font(.footnote)
              .fontWeight(.regular)
              .foregroundColor(Color.black)
              .multilineTextAlignment(.center)
              .lineLimit(1)
          }
        }
      }
    }
}

struct PaymentCycleView_Previews: PreviewProvider {
    static var previews: some View {
      PaymentCycleView(paymentDetails: paymentData)
    }
}

struct ArcShape: Shape {
  let startAngle: Double
  let endAngle: Double
  let gapValue = 5.0
  
  func path(in rect: CGRect) -> Path {
    var path = Path()
    path.addArc(center: CGPoint.init(x: rect.midX,
                                     y: rect.midY),
                radius: rect.width/2 ,
                startAngle: Angle(degrees: startAngle + gapValue),
                endAngle: Angle(degrees: endAngle - gapValue),
                clockwise: false)
    
    let strokeStyle = StrokeStyle.init(lineWidth: 8.0,
                                       lineCap: .round)
                                       
    path = path.strokedPath(strokeStyle)
    return path
  }
}

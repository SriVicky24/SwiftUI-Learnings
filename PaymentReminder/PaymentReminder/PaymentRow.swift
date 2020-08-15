//
//  PaymentRow.swift
//  PaymentReminder
//
//  Created by Sri Vignesh on 11/8/20.
//

import SwiftUI

struct PaymentRow: View {
  
  var payment: Payment
  var didBtnTapped: () -> Void
  
  var body: some View {
      HStack {
        Text("")
          .frame( width: 5,height:60)
          .background(payment.status ? Color.green : Color.blue)
        // Payment Split
        VStack (alignment: .leading) {
          Text(payment.name)
            .font(.subheadline)
            .fontWeight(.semibold)
          Text(payment.date)
            .font(.caption2)
            .fontWeight(.regular)
            .foregroundColor(.gray)
        }
        Spacer()
        //Payment Status
        VStack(alignment: .trailing) {
          Text(payment.amount)
            .font(.headline)
            .fontWeight(.semibold)
          Text(payment.status ? "Paid" : "Due")
            .font(.footnote)
            .fontWeight(.semibold)
            .foregroundColor(.blue)
        }
        Spacer()
          .frame(width: 20)
        Divider()
          .frame(height: 40)
        Button(action: {
          self.didBtnTapped()
        }) {
          Image("icRightArrow")
            .resizable()
            .frame(width: 20, height: 20)
            .foregroundColor(.black)
        }
        .padding(.leading, 5)
        .padding(.trailing, 10)

      }
      .frame(height: 60)
      .background(Color.blue.opacity(0.20))
    }
}

//struct PaymentRow_Previews: PreviewProvider {
//    static var previews: some View {
//      PaymentRow(paymentDetails: paymentInfo.payments[0], didBtnTapped: <#() -> Void#>)
//    }
//}

struct CurvedRectangleShape: Shape {
  func path(in rect: CGRect) -> Path {
    let path = UIBezierPath.init(roundedRect: rect,
                                 byRoundingCorners: [.topRight, .bottomRight], cornerRadii: CGSize(width: 10, height: 10))
    return Path(path.cgPath)
  }
}



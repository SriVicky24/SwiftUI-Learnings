//
//  ContentView.swift
//  PaymentReminder
//
//  Created by Sri Vignesh on 11/8/20.
//

import SwiftUI

struct ContentView: View {
  
  var paymentDetails = paymentData
  
  @State var selectedRow : Int = -1
  
  var body: some View {
    GeometryReader { g in
      ScrollView {
        PaymentCycleView(paymentDetails: paymentDetails)
          .padding(.vertical)
        ForEach (paymentDetails.payments, id: \.id) { payment in
          HStack {
            PaymentRow(payment: payment,
                       didBtnTapped: {
                        self.updateSelectedRow(forIndex: payment.id)})
              .frame(height: 60)
              .clipShape(CurvedRectangleShape())
              .background(CurvedRectangleShape().fill(Color.white).shadow(color: .gray,
                                                                          radius: 5, x: 0, y: 1))
              .padding(.trailing, 10)
              .padding(.vertical, 5)
              .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                if selectedRow == payment.id {
                  selectedRow = -1
                }
                else {
                  selectedRow = payment.id
                }
              })
            if selectedRow != payment.id {
              Spacer(minLength: 50)
            }
          }
          .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
        }
      }
      .frame(width: g.size.width)
    }
    .background(Color.gray.opacity(0.1))
  }
  
  func updateSelectedRow(forIndex index: Int) {
    selectedRow = index
  }
  
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

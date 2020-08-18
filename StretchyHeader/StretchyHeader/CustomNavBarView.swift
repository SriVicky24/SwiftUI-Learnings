//
//  CustomNavBarView.swift
//  StretchyHeader
//
//  Created by Sri Vignesh on 18/8/20.
//

import SwiftUI

struct CustomNavBarView: View {
  
  var navBarButtonAction: () -> Void
  
    var body: some View {
      HStack {
        Text("Adobe Creek GC")
          .font(.title2)
          .foregroundColor(.primary)
          .fontWeight(.semibold)
        Spacer()
        Button(action: navBarButtonAction, label: {
          Text("START")
            .foregroundColor(.white)
            .padding(.vertical,10)
            .padding(.horizontal, 25)
            .background(Color.green).cornerRadius(8.0)
        })
      }
      .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top == 0 ? 15 : (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 5)
      .padding(.horizontal)
      .padding(.vertical, 10)
      .background(Color.white)
    }
}

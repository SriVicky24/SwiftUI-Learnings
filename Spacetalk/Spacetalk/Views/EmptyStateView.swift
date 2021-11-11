//
//  EmptyStateView.swift
//  Spacetalk
//
//  Created by Sri Badrinath on 29/10/21.
//

import SwiftUI

struct EmptyStateView: View {
  
  var title: String
  var description: String
  var imageName: String
  
    var body: some View {
      VStack(spacing: 16) {
        Image(imageName)
          .frame(width: 85,
                 height: 85)
        Text(title)
          .configureFont(withStyle: .h2)
          .foregroundColor(Theme.Color.BlackDark)
        Text(description)
          .configureFont(withStyle: .p1)
          .lineLimit(3)
          .multilineTextAlignment(.center)
          .foregroundColor(Theme.Color.BlackDark)
      }
      .padding()
    }
}

struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateView(title: "No Reminders Yet",
                       description: "Set Reminders for medications and important events",
                       imageName: "ic_no_device")
    }
}

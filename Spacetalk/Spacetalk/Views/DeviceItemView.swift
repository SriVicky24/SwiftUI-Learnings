//
//  DeviceItemView.swift
//  Spacetalk
//
//  Created by Sri Badrinath on 29/10/21.
//

import SwiftUI

struct DeviceItemView: View {
    var body: some View {
      VStack (spacing: 8) {
        Circle()
          .frame(width: 60,
                 height: 60)
          .foregroundColor(Color.blue)
        
        Text("Device 1 Device 1")
          .lineLimit(2)
      }
      .frame(width: 100,
             height: 120)
      .padding()
      .background(Color.orange)
    }
}

struct DeviceItemView_Previews: PreviewProvider {
    static var previews: some View {
        DeviceItemView()
    }
}

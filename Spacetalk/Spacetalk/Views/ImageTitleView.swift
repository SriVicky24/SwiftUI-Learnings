//
//  ImageTitleView.swift
//  Spacetalk
//
//  Created by Sri Badrinath on 28/10/21.
//

import SwiftUI

struct ImageTitleView: View {
  
  var title: String
  var imageName: String
  
    var body: some View {
      VStack {
        ZStack {
          Circle()
            .foregroundColor(Theme.Color.PrimaryBrand)
            .frame(width: 50,
                   height: 50)
          Image(imageName)
            .resizable()
            .frame(width: 20, height: 20)
            .foregroundColor(Color.white)
        }

        Text(title)
          .configureFont(withStyle: .p1)
          .foregroundColor(Theme.Color.BlackDark)
      }
    }
}

struct ImageTitleView_Previews: PreviewProvider {
    static var previews: some View {
        ImageTitleView(title: "Support",
                       imageName: "ic_info")
    }
}

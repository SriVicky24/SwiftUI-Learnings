//
//  ContentView.swift
//  Shared
//
//  Created by Sri Vignesh on 4/9/20.
//

import SwiftUI
struct ContentView: View {
  
  #if os(iOS)
  @Environment(\.horizontalSizeClass) private var horizontalSizeClass
  #endif

  
  var body: some View {
    #if os(iOS)
    if horizontalSizeClass == .compact {
      TabBarNavigation()
    }
    else {
      SideBarNavigation()
    }
    #else
     SideBarNavigation()
    #endif
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
      ContentView()
  }
}

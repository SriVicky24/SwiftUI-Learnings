//
//  TabBar.swift
//  UniversalApp
//
//  Created by Sri Vignesh on 4/9/20.
//

import SwiftUI

struct TabBarNavigation: View {
  var body: some View {
    TabView {
      ArticleListView()
        .tabItem {
          Text("Articles")
        }
      ProfileView()
        .tabItem {
          Text("Profile")
        }
    }
  }
}

struct TabBarNavigation_Previews: PreviewProvider {
  static var previews: some View {
    TabBarNavigation()
  }
}

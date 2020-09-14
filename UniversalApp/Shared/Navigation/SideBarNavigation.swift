//
//  SideBarNavigation.swift
//  UniversalApp
//
//  Created by Sri Vignesh on 4/9/20.
//

import SwiftUI

struct SideBarNavigation: View {
  var body: some View {
    NavigationView {
      listContent
      ArticleListView()
    }
  }
  
  var listContent: some View {
    List {
      NavigationLink(
        destination: ArticleListView(),
        label: {
          Label("Articles", systemImage: "book.closed")
        })
      Label("Profile", systemImage: "person.fill")
    }
    .listStyle(SidebarListStyle())
  }
  
}

struct SideBarNavigation_Previews: PreviewProvider {
  static var previews: some View {
    SideBarNavigation()
  }
}

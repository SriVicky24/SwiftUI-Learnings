//
//  HomeView.swift
//  TranspireCodingChallenge
//
//  Created by Sri Badrinath on 7/11/21.
//

import SwiftUI

struct HomeView: View {
  
  @StateObject private var viewModel = FeedViewModel()
  
    var body: some View {
      VStack {
        headerView
        List {
          ForEach(viewModel.feedItems.indices, id: \.self) { index in
            if index == 0 {
              FeedHeaderRowView(item: viewModel.feedItems[index])
            }
            else {
              FeedRowView(item: viewModel.feedItems[index])
            }
          }
        }
        .listStyle(PlainListStyle())
        
        Spacer(minLength: 0)
      }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

extension HomeView {
  
  var headerView: some View {
    Image("logo")
      .resizable()
      .scaledToFill()
      .frame(width: 150,
             height: 50,
             alignment: .center)
      
      
  }
}

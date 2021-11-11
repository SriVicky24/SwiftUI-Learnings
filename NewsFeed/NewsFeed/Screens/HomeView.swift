//
//  HomeView.swift
//  NewsFeed
//
//  Created by Sri Badrinath on 8/11/21.
//

import SwiftUI

struct HomeView: View {
  
  @StateObject private var viewModel = HomeViewModel()
  
    var body: some View {
      VStack {
        navigationTitleView
        
        ScrollView(.vertical,
                   showsIndicators: false) {
          VStack {
            ForEach(viewModel.articleItems.indices, id: \.self) { index in
              if index == 0 {
                ArticleHeaderRow(item: viewModel.articleItems[index])
              }
              else {
                ArticleRowView(item: viewModel.articleItems[index])
              }
              Divider()
            }
          }
        }
        .padding(.horizontal, 16)
        .alert(isPresented: Binding<Bool>.constant($viewModel.backgroundError.wrappedValue != nil)) {
          Alert(
            title: Text("Error"),
            message: Text($viewModel.backgroundError.wrappedValue?.description ?? ""),
            dismissButton: .default(Text("Ok"), action: {
              viewModel.backgroundError = nil
            })
          )
        }
        Spacer(minLength: 0)
      }
      .onAppear {
        viewModel.getArticles()
      }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
      HomeView()
    }
}

extension HomeView {
  
  /// Navigation Title View
  /// Displays a logo with fixed height and width.
  var navigationTitleView: some View {
    Image("logo")
      .resizable()
      .scaledToFill()
      .frame(width: 150,
             height: 50,
             alignment: .center)
  }
}


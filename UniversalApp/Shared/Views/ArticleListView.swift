//
//  ArticleListView.swift
//  UniversalApp
//
//  Created by Sri Vignesh on 4/9/20.
//

import SwiftUI

struct ArticleListView: View {
  
  @State private var selectedArticle: Article?
  @State private var showDetail: Bool = false
  @Namespace var namespace
  
  var body: some View {
    ZStack {
      ScrollView(.vertical,
                 showsIndicators: true,
                 content: {
                  content
                    .zIndex(1)
                 })
        .padding(.top, 5)
      detailContent
      
    }
}
  
  
  var content: some View {
    ScrollView {
      VStack (spacing: 8) {
        Text("Articles")
          .font(.largeTitle)
          .fontWeight(.bold)
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding(.horizontal, 16)
        
        LazyVGrid(columns: [GridItem.init(.adaptive(minimum: 160), spacing: 16)],
                  alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/,
                  spacing: 16) {
          ForEach(articles, id: \.id) { article in
            VStack {
              ArticleItem(article: article)
                .matchedGeometryEffect(id: article.id,
                                       in: namespace, isSource: !showDetail)
                .onTapGesture(count: 1, perform: {
                  withAnimation(.spring(response: 0.4, dampingFraction: 0.7, blendDuration: 0)) {
                    showDetail.toggle()
                    selectedArticle = article
                  }
                })
            }
            .matchedGeometryEffect(id: "container\(article.id)", in: namespace, isSource: !showDetail)
          }
        }
        .padding(.horizontal, 16)
      }
    }
  }
  
  @ViewBuilder
  var detailContent: some View {
    if let article = selectedArticle {
      ZStack (alignment: .topTrailing) {
        ArticleDetailView(article: article,
                          nameSpace: namespace)
        CloseButton()
          .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
            withAnimation(.spring()) {
              showDetail.toggle()
              selectedArticle = nil
            }
          })
          .padding(.trailing, 16)
      }
      .zIndex(2)
    }
  }
  
  
}

struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView()
    }
}

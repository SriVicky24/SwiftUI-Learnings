//
//  ArticleDetailView.swift
//  UniversalApp
//
//  Created by Sri Vignesh on 4/9/20.
//

import SwiftUI

struct ArticleDetailView: View {
  
  var article: Article
  var nameSpace: Namespace.ID
  
  var body: some View {
    VStack {
      ScrollView {
        Image(article.imageName)
          .resizable()
          .matchedGeometryEffect(id: article.id, in: nameSpace)
          .frame(height: 250)
        
        VStack (alignment: .leading, spacing: 5) {
          Text(article.name)
            .font(.largeTitle)
            .fontWeight(.semibold)
          Text(article.authorName)
            .font(.subheadline)
        }
          .padding(.horizontal, 5)
          .padding(.vertical, 5)
        if let descriptions = article.content {
          Text(descriptions)
            .font(.body)
            .padding(.horizontal, 5)
            .padding(.vertical, 5)
        }
        Spacer()
      }
    }
    .background(Color.white)
    .clipShape(RoundedRectangle.init(cornerRadius: 22, style: .continuous))
    .matchedGeometryEffect(id: "container\(article.id)", in: nameSpace)
    .edgesIgnoringSafeArea(.all)
  }
}

struct ArticleDetailVieqw_Previews: PreviewProvider {
  @Namespace static var namespace
    static var previews: some View {
      ArticleDetailView(article: articles[0], nameSpace: namespace)
    }
}

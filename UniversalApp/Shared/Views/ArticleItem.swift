//
//  ArticleItem.swift
//  UniversalApp
//
//  Created by Sri Vignesh on 4/9/20.
//

import SwiftUI

struct ArticleItem: View {
  #if os(iOS)
  var cornerRadius: CGFloat = 16
  #else
  var cornerRadius: CGFloat = 10
  #endif
  
  var article: Article
  
  var body: some View {
    VStack (alignment: .leading, spacing: 5) {
        ZStack(alignment: .topLeading) {
          Image(article.imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
          Text(article.type.description().uppercased())
            .font(.footnote)
            .padding(.horizontal, 15)
            .padding(.vertical, 5)
            .background(Color.black.opacity(0.7))
            .foregroundColor(.white)
        }
        VStack(alignment: .leading, spacing: 5) {
        
        // Article Title
          Text(article.name)
            .font(.body)
            .fontWeight(.semibold)
            .lineLimit(3)
        
        // Author Name
          Text("by \(article.authorName)")
            .font(.caption)
            .fontWeight(.regular)
          
          // Likes and Shares
          HStack (alignment: .center, spacing: 10) {
            Text("\(article.like) Likes")
              .font(.caption2)
            Text("\(article.shares) Shares")
              .font(.caption2)
          }
          .padding(.vertical, 5)
        }
        .padding(.horizontal, 8)
      }
      .background(Color.white)
      .clipShape(RoundedRectangle(cornerRadius: cornerRadius,
                                  style: .continuous))
      .shadow(color: Color.black.opacity(0.4),
              radius: 20,
              x: 0,
              y: 10.0)
  }
}

struct ArticleItem_Previews: PreviewProvider {
  static var previews: some View {
    ArticleItem(article: articles[0])
  }
}

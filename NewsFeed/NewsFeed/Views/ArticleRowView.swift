//
//  ArticleRowView.swift
//  NewsFeed
//
//  Created by Sri Badrinath on 8/11/21.
//

import SwiftUI

struct ArticleRowView: View {
    
    var item: ArticleItem
  
    var body: some View {
      HStack {
        VStack(alignment: .leading, spacing: 8) {
          // Title
          Text(item.title)
            .foregroundColor(Color.blue)
            .font(.body)
          
          // Date
          Text(Date().mediumStyleDateFromString(
            dateString:item.publishDate)
          )
            .foregroundColor(Color.gray)
            .font(.caption)
        }
        .padding()
        Spacer(minLength: 0)
        
        if let thumbnail = item.thumbnail {
          ArticleImageView(withId: item.id,
                           andImageUrl: thumbnail)
            .frame(width: 150,
                   height: 150)
        }
      }
    }
}

struct ArticleRowView_Previews: PreviewProvider {
    static var previews: some View {
      
      ArticleRowView(item:ArticleItem.init(
        withTitle:"Mystery surrounds kangaroo that got stuck on a hot tin roof in Mount Isa",
        date: "2021-11-08 10:54:28",
        thumbnail: nil,
        enclosure: Enclosure.init(withLink: nil))
      )
    }
}

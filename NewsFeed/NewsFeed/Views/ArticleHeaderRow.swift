//
//  ArticleHeaderRow.swift
//  NewsFeed
//
//  Created by Sri Badrinath on 8/11/21.
//

import SwiftUI

struct ArticleHeaderRow: View {
  var item: ArticleItem
  
    var body: some View {
      VStack {
        // Header Image
        if let thumbnail = item.enclosure.link {
          ArticleImageView(withId: item.id,
                           andImageUrl: thumbnail)
            .frame(height: 260)
        }
        contents
      }
    }
 
  var contents: some View {
    VStack(alignment: .leading, spacing: 8) {
      // Title
      Text(item.title)
        .foregroundColor(Color.blue)
        .font(.largeTitle)
      
      // Date
      Text(Date().mediumStyleDateFromString(dateString: item.publishDate))
        .foregroundColor(Color.gray)
        .font(.caption)
        .multilineTextAlignment(.leading)
    }
    .padding(.horizontal, 16)
  }
}

struct ArticleHeaderRow_Previews: PreviewProvider {
    static var previews: some View {
      ArticleHeaderRow(item:ArticleItem.init(
        withTitle:"Mystery surrounds kangaroo that got stuck on a hot tin roof in Mount Isa",
        date: "2021-11-08 10:54:28",
        thumbnail: nil,
        enclosure: Enclosure.init(withLink: "https://live-production.wcms.abc-cdn.net.au/5041b5f400d76c4d498331d739ff972d"))
      )
    }
}

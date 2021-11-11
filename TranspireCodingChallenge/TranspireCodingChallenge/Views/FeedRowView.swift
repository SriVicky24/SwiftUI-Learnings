//
//  FeedRowView.swift
//  TranspireCodingChallenge
//
//  Created by Sri Badrinath on 7/11/21.
//

import SwiftUI

struct FeedRowView: View {
  
  var item: FeedItem
  
    var body: some View {
      HStack {
        VStack(alignment: .leading, spacing: 8) {
          // Title
          Text(item.title)
            .foregroundColor(Color.blue)
            .font(.body)
          
          // Date
          Text(Date().mediumStyleDateFromString(dateString: item.publishDate))
            .foregroundColor(Color.gray)
            .font(.caption)
        }
        .padding()
        Spacer(minLength: 0)
        
        if let thumbnail = item.thumbnail {
          ArticleImageView(withId: item.id,
                           andUrl: thumbnail)
            .frame(width: 150,
                   height: 150)
        }
      }
    }
}

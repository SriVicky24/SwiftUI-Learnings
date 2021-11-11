//
//  FeedHeaderRowView.swift
//  TranspireCodingChallenge
//
//  Created by Sri Badrinath on 7/11/21.
//

import SwiftUI

struct FeedHeaderRowView: View {
  
  var item: FeedItem
  
    var body: some View {
      VStack {
        // Header Image
        if let thumbnail = item.thumbnail {
          ArticleImageView(withId: item.id,
                           andUrl: thumbnail)
            .frame(width: .infinity,
                   height: 260)
        }
        VStack(alignment: .leading, spacing: 8) {
          // Title
          Text(item.title)
            .foregroundColor(Color.blue)
            .font(.largeTitle)
          
          // Date
          Text(Date().mediumStyleDateFromString(dateString: item.publishDate))
            .foregroundColor(Color.gray)
            .font(.caption)
        }
        .padding()
      }
    }
}

//struct FeedHeaderRowView_Previews: PreviewProvider {
//
//    static var previews: some View {
//
//      let item = FeedItem.init(
//        title: "Green Sea Turtle make an astounding come back in central NYC",
//        publishDate: "April 1, 2014 06: 37 PM",
//        author: "",
//        thumbnail: nil
//      )
//
//FeedHeaderRowView(item: item)
//    }
//}

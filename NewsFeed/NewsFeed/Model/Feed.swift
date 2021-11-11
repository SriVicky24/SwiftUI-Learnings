//
//  Feed.swift
//  NewsFeed
//
//  Created by Sri Badrinath on 8/11/21.
//

import Foundation

/// Feed - Codable
///  Use this class to know the status and list of articles of a feed.

struct Feed: Codable {
  /// Status Information
  let status: String
  
  /// Array of article items
  let items: [ArticleItem]
}


//
//  ArticleItem.swift
//  NewsFeed
//
//  Created by Sri Badrinath on 8/11/21.
//

import Foundation

struct ArticleItem: Codable, Identifiable {
  let id = UUID()
  let title: String
  let publishDate: String
  let thumbnail: String?
  let enclosure: Enclosure
  
  init(withTitle title: String, date: String, thumbnail: String?, enclosure: Enclosure) {
    self.title = title
    self.publishDate = date
    self.thumbnail = thumbnail
    self.enclosure = enclosure
  }
  
  
  enum CodingKeys: String, CodingKey {
    case title
    case publishDate = "pubDate"
    case thumbnail
    case enclosure
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    let title = try container.decode(String.self, forKey: .title)
    let publishDate = try container.decode(String.self, forKey: .publishDate)
    
    var imageUrlString: String?
    let urlString = try container.decode(String.self, forKey: .thumbnail)
    if let splitIndex = urlString.firstIndex(of: "?") {
      imageUrlString = String(urlString[..<splitIndex])
    }
    else {
      imageUrlString = nil
    }
    
    let enclosure = try container.decode(Enclosure.self, forKey: .enclosure)
    
    self.init(withTitle: title,
              date: publishDate,
              thumbnail: imageUrlString,
              enclosure: enclosure)
  }
}

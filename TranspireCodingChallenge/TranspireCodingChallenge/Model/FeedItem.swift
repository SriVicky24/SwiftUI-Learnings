//
//  FeedItem.swift
//  TranspireCodingChallenge
//
//  Created by Sri Badrinath on 6/11/21.
//

import Foundation

struct FeedItem: Codable, Identifiable {
  let id = UUID()
  let title: String
  let publishDate: String
  let author: String
  let thumbnail: String?
  
  
  enum CodingKeys: String, CodingKey {
    case title
    case publishDate = "pubDate"
    case thumbnail
    case author
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    title = try container.decode(String.self, forKey: .title)
    publishDate = try container.decode(String.self, forKey: .publishDate)
    author = try container.decode(String.self, forKey: .author)
    
    let urlString = try container.decode(String.self, forKey: .thumbnail)
    if let splitIndex = urlString.firstIndex(of: "?") {
      thumbnail = String(urlString[..<splitIndex])
    }
    else {
      thumbnail = nil
    }
  }
  
}

struct Enclosure: Codable {
  
  let link: String?
  let type: String?
  let thumbnail: String?
  
}


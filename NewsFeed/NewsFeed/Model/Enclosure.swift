//
//  Enclosure.swift
//  NewsFeed
//
//  Created by Sri Badrinath on 9/11/21.
//

import Foundation

struct Enclosure: Codable {
  let link: String?
  
  enum CodingKeys: String, CodingKey {
    case link
  }
  
  init(withLink link: String?) {
    self.link = link
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    var linkUrlString: String?
    let urlString = try container.decode(String.self, forKey: .link)
    if let splitIndex = urlString.firstIndex(of: "?") {
      linkUrlString = String(urlString[..<splitIndex])
    }
    else {
      linkUrlString = nil
    }
    self.init(withLink: linkUrlString)
    
  }
}

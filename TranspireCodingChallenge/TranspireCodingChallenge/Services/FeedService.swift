//
//  FeedService.swift
//  TranspireCodingChallenge
//
//  Created by Sri Badrinath on 6/11/21.
//

import Foundation
import Combine

class FeedService {
  
  @Published var feedItems : [FeedItem] = []
  
  var feedSubscription: AnyCancellable?
  
  init() {
    getFeed()
  }
  
  private func getFeed() {
    
    let urlString = "https://api.rss2json.com/v1/api.json?rss_url=http://www.abc.net.au/news/feed/51120/rss.xml"
    
    let httpRequest = HTTPRequest.init(withURL: urlString,
                                       method: .post)
    
    
    
    feedSubscription = NetworkManager.fetchData(fromRequest: httpRequest)
                                      .decode(type: Feed.self, decoder: JSONDecoder())
                                      .sink(receiveCompletion: NetworkManager.handleCompletion,
                                            receiveValue: { [weak self] feed in
                                              if feed.status == "ok" {
                                                self?.feedItems = feed.items
                                                self?.feedSubscription?.cancel()
                                              }
                                        })
  }
}

//
//  ArticleService.swift
//  NewsFeed
//
//  Created by Sri Badrinath on 8/11/21.
//

import Foundation
import Combine

protocol ArticleServiceProtocol {
  
  var networkManager: NetworkManagerProtocol { get }
  
  func getArticles() -> AnyPublisher<Feed, AppError>
  
}

final class ArticleService: ArticleServiceProtocol {
  
  var networkManager: NetworkManagerProtocol
  
  init(with networkManager: NetworkManagerProtocol = NetworkManager()) {
    self.networkManager = networkManager
  }
  
  func getArticles() -> AnyPublisher<Feed, AppError> {
    
    guard let url = URL(
      string: "https://api.rss2json.com/v1/api.json?rss_url=http://www.abc.net.au/news/feed/51120/rss.xml"
    ) else { return Fail<Feed, AppError>(error: AppError.invalidURL).eraseToAnyPublisher()}
    
    return networkManager.fetchData(fromURL: url)
      .decode(type: Feed.self, decoder: JSONDecoder())
      .mapError {_ in AppError.clientError}
      .eraseToAnyPublisher()
  }
}

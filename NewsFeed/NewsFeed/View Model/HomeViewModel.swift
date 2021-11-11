//
//  HomeViewModel.swift
//  NewsFeed
//
//  Created by Sri Badrinath on 8/11/21.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
  
  @Published var articleItems: [ArticleItem] = []
  @Published var backgroundError: AppError?
  
  private let articleService: ArticleServiceProtocol
  private var cancellables = Set<AnyCancellable>()
  
  init() {
    self.articleService = ArticleService()
  }
  
  /// Use this method to get the articles . 
  
  func getArticles() {
    
    articleService.getArticles()
      .receive(on: DispatchQueue.main)
      .sink { completion in
        switch completion {
          case .finished: break
          case .failure(let error):
            self.backgroundError = error
        }
      } receiveValue: { [weak self] feed in
        if feed.status == "ok" {
          self?.articleItems = feed.items
        }
      }
      .store(in: &cancellables)

  }
}

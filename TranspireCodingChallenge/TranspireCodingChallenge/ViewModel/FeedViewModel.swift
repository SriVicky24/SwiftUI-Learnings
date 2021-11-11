//
//  FeedViewModel.swift
//  TranspireCodingChallenge
//
//  Created by Sri Badrinath on 6/11/21.
//

import Foundation
import Combine

class FeedViewModel: ObservableObject {
  
  @Published var feedItems: [FeedItem] = []
  
  private let feedService = FeedService()
  private var cancellables = Set<AnyCancellable>()
  
  init() {
    addSubscribers()
  }
  
  
  private func addSubscribers() {
    feedService.$feedItems
      .sink { [weak self] feedItems in
        self?.feedItems = feedItems
      }
      .store(in: &cancellables)
  }
}

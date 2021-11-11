//
//  ArticleImageViewModel.swift
//  NewsFeed
//
//  Created by Sri Badrinath on 8/11/21.
//

import Foundation
import SwiftUI
import Combine

class ArticleImageViewModel: ObservableObject {
  
  @Published var image: UIImage? = nil
  @Published var isLoading: Bool = true
  
  private let imageDownloadService: ImageDownloadService
  private var cancellables = Set<AnyCancellable>()
  
  init(withImageId id: UUID, andImageUrl imageUrl: String) {
    
    imageDownloadService = ImageDownloadService.init(withId: id,
                                                     andImageUrl: imageUrl)
    addSubscribers()
  }
  
  private func addSubscribers() {
    
    imageDownloadService.$image
      .sink { [weak self] _ in
        self?.isLoading = false
      } receiveValue: { [weak self] newImage in
        self?.image = newImage
      }
      .store(in: &cancellables)
  }
}


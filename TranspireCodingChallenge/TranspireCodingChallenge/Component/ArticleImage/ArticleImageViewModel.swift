//
//  ArticleImageViewModel.swift
//  TranspireCodingChallenge
//
//  Created by Sri Badrinath on 7/11/21.
//

import Foundation
import SwiftUI
import Combine

class ArticleImageViewModel: ObservableObject {
  
  @Published var image: UIImage? = nil
  @Published var isLoading: Bool = true
  
  private let imageDownloadService: ImageDownloadService
  private var cancellables = Set<AnyCancellable>()
  
  init(withImageId imageId: UUID, andURL imageUrl: String) {
    
    imageDownloadService = ImageDownloadService.init(withId: imageId,
                                                     andImageURL: imageUrl)
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

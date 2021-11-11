//
//  ImageDownloadService.swift
//  NewsFeed
//
//  Created by Sri Badrinath on 8/11/21.
//

import Foundation
import UIKit
import Combine

///
/// Image Download Service
/// Use this service to download the image from a given url.
///  And saves the image in device caches folder.
///

class ImageDownloadService {
  
  @Published var image: UIImage? = nil
  
  private var imageDownloadSubscription: AnyCancellable?
  private let fileManager = AppFileManager.instance
  private let folderName = "article_images"
  
  private let imageName: String
  private let imageUrl: String
  
  private let networkManager: NetworkManagerProtocol
  
  init(withId id: UUID, andImageUrl imageUrl: String) {
    self.imageName = id.uuidString
    self.imageUrl = imageUrl
    self.networkManager = NetworkManager()
    getImage()
  }
  
  private func getImage() {
    
    if let savedImage = fileManager.getImage(imageName: imageName,
                                             folderName: folderName) {
      image = savedImage
    }
    else {
      downloadImage()
    }
  }
  
  
  private func downloadImage() {
    
    guard let url = URL(string: imageUrl) else { return }
    
    imageDownloadSubscription = networkManager.fetchData(fromURL: url)
                                      .tryMap({ data -> UIImage? in
                                        return UIImage(data: data)
                                      })
                                      .sink(receiveCompletion: networkManager.handleCompletion,
                                            receiveValue: { [weak self] image in
                                        guard let self = self,
                                              let downloadedImage = image
                                                else { return }
                                          self.image = downloadedImage
                                          self.imageDownloadSubscription?.cancel()
                                          self.fileManager.saveImage(image: downloadedImage,
                                                                     imageName: self.imageName,
                                                                     folderName: self.folderName)
                                      })
    
  }
}

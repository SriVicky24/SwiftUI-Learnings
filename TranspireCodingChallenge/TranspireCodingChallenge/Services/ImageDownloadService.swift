//
//  ImageDownloadService.swift
//  TranspireCodingChallenge
//
//  Created by Sri Badrinath on 7/11/21.
//

import Foundation
import UIKit
import Combine

class ImageDownloadService {
  
  @Published var image: UIImage? = nil
  
  private var imageDownloadSubscription: AnyCancellable?
  private let fileManager = AppFileManager.instance
  private let folderName = "article_images"
  
  private let imageName: String
  private let imageUrl: String
  
  init(withId id: UUID, andImageURL imageURL: String) {
    self.imageName = id.uuidString
    self.imageUrl = imageURL
    getImage()
  }
  
  private func getImage() {
    
    if let savedImage = fileManager.getImage(imageName: imageName,
                                             folderName: folderName) {
      image = savedImage
      print("Image retrieved from saved folder")
    }
    else {
      downloadImage()
      print("Downloading Image")
    }
  }
  
  
  private func downloadImage() {
    
    let httpRequest = HTTPRequest.init(withURL: imageUrl,
                                       method: .get)
    
    
    
    imageDownloadSubscription = NetworkManager.fetchData(fromRequest: httpRequest)
                                      .tryMap({ data -> UIImage? in
                                        return UIImage(data: data)
                                      })
                                      .sink(receiveCompletion: NetworkManager.handleCompletion,
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

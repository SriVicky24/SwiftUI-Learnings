//
//  AppFileManager.swift
//  NewsFeed
//
//  Created by Sri Badrinath on 8/11/21.
//

import Foundation
import SwiftUI

///
/// AppFileManager
///  Singleton class manages the file operations such as save and fetch  images

class AppFileManager {
  
  static let instance = AppFileManager()
  
  private init() { }
  
  func saveImage(image: UIImage, imageName: String, folderName: String) {
    
    createFolder(folderName: folderName)
    
    guard
      let data = image.pngData(),
      let url = getURLForImage(imageName: imageName,
                               folderName: folderName)
      else { return }
    
    do {
      try data.write(to: url)
    }
    catch let error {
      print("Error while saving a image. \(error)")
    }
  }
  
  
  func getImage(imageName: String, folderName: String) -> UIImage? {
    guard let url = getURLForImage(imageName: imageName,
                                   folderName: folderName),
          FileManager.default.fileExists(atPath: url.path) else {
      return nil
    }
    
    return UIImage(contentsOfFile: url.path)
    
  }
  
//  MARK: - Private methods
  
  private func createFolder(folderName: String) {
    guard let url = getURLForFolder(name: folderName) else { return }
    
    if !FileManager.default.fileExists(atPath: url.path) {
      do {
        try FileManager.default.createDirectory(at: url,
                                                withIntermediateDirectories: true,
                                                attributes: nil)
      }
      catch let error {
        print("Error while creating a directory. \(error)")
      }
    }
  }
  
  private func getURLForFolder(name: String) -> URL? {
    
    guard let url = FileManager.default.urls(for: .cachesDirectory,
                                                in: .userDomainMask).first else { return nil }
    
    
    return url.appendingPathComponent(name)
    
  }
  
  private func getURLForImage(imageName: String, folderName: String) -> URL? {
    
    guard let folderURL = getURLForFolder(name: folderName) else { return nil }
    
    return folderURL.appendingPathComponent(imageName + ".png")
    
  }
  
}


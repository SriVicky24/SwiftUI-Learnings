//
//  NetworkManager.swift
//  NewsFeed
//
//  Created by Sri Badrinath on 8/11/21.
//

import Foundation
import Combine

/// Protocol : Network Manager Protocol

protocol NetworkManagerProtocol {
  
  func fetchData(fromURL url: URL) -> AnyPublisher<Data, Error>
  
  func handleCompletion(completion: Subscribers.Completion<Error>)
}

/// Network Manager
///  Use this class to manage network calls
///

final class NetworkManager: NetworkManagerProtocol {
  
  ///
  /// Fetch Data for decodable Type
  ///  Arguments: URL and Type
  ///  A resuable method used to fetch data from the respective url. Throws error if we have bad server response.
  ///
  
  func fetchData(fromURL url: URL) -> AnyPublisher<Data, Error> {
    
    return URLSession.shared.dataTaskPublisher(for: url)
      .subscribe(on:DispatchQueue.global(qos: .default))
      .tryMap { output -> Data in
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
                throw AppError.badServerResponse
              }
        return output.data
      }
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
  }
  
  
  ///
  /// Handle Completion
  ///  Responsible to handle the completion of network call
  ///
  func handleCompletion(completion: Subscribers.Completion<Error>) {
    switch completion {
        case .finished: break
        case .failure(let error):
          print(error.localizedDescription)
      }
  }
}


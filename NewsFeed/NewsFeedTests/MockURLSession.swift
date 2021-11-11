//
//  MockURLSession.swift
//  NewsFeedTests
//
//  Created by Sri Badrinath on 10/11/21.
//

import Foundation
import Combine

@testable import NewsFeed

class MockURLSession: NetworkManagerProtocol {
  
  var responseData: Data!
  var error: AppError?
  
  func fetchData(fromURL url: URL) -> AnyPublisher<Data, Error> {
    return Just(responseData!)
      .setFailureType(to: Error.self)
      .eraseToAnyPublisher()
  }
  
  func handleCompletion(completion: Subscribers.Completion<Error>) {
    
  }
}

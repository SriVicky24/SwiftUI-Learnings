//
//  NetworkManager.swift
//  TranspireCodingChallenge
//
//  Created by Sri Badrinath on 6/11/21.
//

import Foundation
import Combine

class NetworkManager {
  
  static func fetchData(fromRequest httpRequest: HTTPRequestType) -> AnyPublisher<Data, Error> {
    
    guard let url = URL.init(string: httpRequest.urlString) else {
      preconditionFailure("Bad URL Request")
    }
    
    var urlRequest = URLRequest.init(url: url,
                                     cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                     timeoutInterval: 90)
    urlRequest.httpMethod = httpRequest.method.rawValue
    urlRequest.allHTTPHeaderFields = httpRequest.headers
    
    let urlSession: URLSessionProtocol = URLSession.shared
    
    return urlSession.data(withURL: url)
                      .subscribe(on: DispatchQueue.global(qos: .default))
                      .tryMap { output -> Data in
                        guard let response = output.response as? HTTPURLResponse,
                              response.statusCode >= 200 && response.statusCode < 300 else {
                                throw URLError(.badServerResponse)
                              }
                        return output.data
                      }
                      .receive(on: DispatchQueue.main)
                      .eraseToAnyPublisher()
    
  }
  
  static func handleCompletion(completion: Subscribers.Completion<Error>) {
    switch completion {
        case .finished: break
        case .failure(let error):
          print(error.localizedDescription)
      }
  }
}


protocol URLSessionProtocol {
  
  typealias SessionResponse = URLSession.DataTaskPublisher.Output
  
  func data(withURL url: URL) -> AnyPublisher<SessionResponse, URLError>
}

extension URLSession: URLSessionProtocol {
  func data(withURL url: URL) -> AnyPublisher<SessionResponse, URLError> {
    return dataTaskPublisher(for: url)
      .eraseToAnyPublisher()
  }
}

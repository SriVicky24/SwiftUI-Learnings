//
//  AppError.swift
//  NewsFeed
//
//  Created by Sri Badrinath on 10/11/21.
//

import Foundation

///
///  App Error type
///

enum AppError: Error {
  case badServerResponse
  case invalidURL
  case clientError
  
  var description: String {
    switch self {
      case .badServerResponse: return "Bad response from server"
      case .invalidURL: return "Invalid URL"
      case .clientError: return "Something went wrong"
    }
  }
  
}

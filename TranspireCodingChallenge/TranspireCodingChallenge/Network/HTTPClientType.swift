//
//  HTTPClientType.swift
//  TranspireCodingChallenge
//
//  Created by Sri Badrinath on 6/11/21.//

import Foundation
import Combine

protocol HTTPClientType {
  func processRequest(_ httpRequest: HTTPRequestType) -> AnyPublisher<Data, HTTPError>
}

enum HTTPError: Error {
  case clientError (statusCode: Int, data: Data?)
  case serverError
  case noNetwork
  case request
  case unknown
  
//  var title: String {
//    switch self {
//      case .noNetwork: return "no_network_error_title".localized
//      case .clientError,
//           .serverError,
//           .request,
//           .unknown: return "generic_error_title".localized
//    }
//  }
//
//  var message: String {
//    switch self {
//      case .noNetwork: return "no_network_error_message".localized
//      case .clientError,
//           .serverError,
//           .request,
//           .unknown: return "generic_error_message".localized
//    }
//  }
}


enum HTTPMethod: String {
  case post = "POST"
  case get = "GET"
}

typealias HTTPHeaders = [String: String]

//
//  HTTPRequestType.swift
//  TranspireCodingChallenge
//
//  Created by Sri Badrinath on 6/11/21.
//

import Foundation

protocol HTTPRequestType {
  var urlString: String { get }
  var method: HTTPMethod { get }
  var headers: HTTPHeaders { get }
}


struct HTTPRequest: HTTPRequestType {
  var urlString: String
  var method: HTTPMethod
  var headers: HTTPHeaders
  
  init(withURL urlString: String, method: HTTPMethod) {
    self.urlString = urlString
    self.method = method
    self.headers = ["Content-Type" : "application/json"]
  }
}

//
//  ArticleServiceTest.swift
//  NewsFeedTests
//
//  Created by Sri Badrinath on 10/11/21.
//

import XCTest
import Combine

@testable import NewsFeed

class ArticleServiceTest: XCTestCase {

  var subscribers = Set<AnyCancellable>()
  
  override func tearDown() {
    subscribers = []
  }
  
  func testService() {
    // Read Data
    var jsonData: Data? = nil
    guard let urlPath = Bundle(for: type(of: self)).url(forResource: "SampleFeed", withExtension: "json") else { return }
    do {
      jsonData = try Data(contentsOf: urlPath)
    }
    catch {
      print("Error while converting to data")
    }
    
    let mockSession = MockURLSession()
    mockSession.responseData = jsonData
    
    let service = ArticleService(with: mockSession)
    
    let expectaions = expectation(description: "Loading Article Feed")
    
    service.getArticles()
          .sink { error in
            print(error)
          } receiveValue: { feed in
            if feed.status == "ok" {
              XCTAssertEqual(1, feed.items.count)
              expectaions.fulfill()
            }
          }
        .store(in: &subscribers)
    
    wait(for: [expectaions],
            timeout: 1)
    
  }
}

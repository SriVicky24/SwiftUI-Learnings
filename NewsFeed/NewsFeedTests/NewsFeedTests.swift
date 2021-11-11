//
//  NewsFeedTests.swift
//  NewsFeedTests
//
//  Created by Sri Badrinath on 8/11/21.
//

import XCTest
import Combine

@testable import NewsFeed

class NewsFeedTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
  
  func testFeedModel()  {

    if let urlPath = Bundle(for: type(of: self)).url(forResource: "SampleFeed", withExtension: "json") {
      let jsonData = try! Data(contentsOf: urlPath)
      let feed = try! JSONDecoder().decode(Feed.self, from: jsonData)
      XCTAssertNotNil(feed)
    }
    else {
      XCTAssertFalse(false, "Could not find a sample data")
    }
  }
  
  func testDateConversion() {
    let publishedDate = "2021-11-08 22:36:38"
    let convertedDate = Date().mediumStyleDateFromString(dateString: publishedDate)
    
    XCTAssertNotNil(convertedDate)
    XCTAssertEqual(convertedDate, "Nov 8, 2021 22:36 PM")
  }
}


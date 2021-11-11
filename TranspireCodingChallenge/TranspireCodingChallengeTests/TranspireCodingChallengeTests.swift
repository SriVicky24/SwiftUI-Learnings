//
//  TranspireCodingChallengeTests.swift
//  TranspireCodingChallengeTests
//
//  Created by Sri Badrinath on 6/11/21.
//

import XCTest
import Combine
@testable import TranspireCodingChallenge

class TranspireCodingChallengeTests: XCTestCase {

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
        measure {
            // Put the code you want to measure the time of here.
        }
    }
  
  
  func testHTTPRequest() throws {
    
    let requestData: Data = """
    {
      "status": "ok",
      "feed": {
          "url": "http://www.abc.net.au/news/feed/51120/rss.xml",
          "title": "Just In",
          "link": "https://www.abc.net.au/news/justin/",
          "author": "",
          "description": "",
          "image": "https://www.abc.net.au/news/image/8413416-1x1-144x144.png"
      },
      "items": [
          {
              "title": "Planning minister to give community a say on Clive Palmer's coal-fired power station proposal",
              "pubDate": "2021-11-09 09:08:40",
              "author": "Emilie Gramenz",
              "thumbnail": "https://live-production.wcms.abc-cdn.net.au/f4337a3fa27b6a33742733f2bfca103d?impolicy=wcms_crop_resize&amp;cropH=1127&amp;cropW=845&amp;xPos=628&amp;yPos=0&amp;width=862&amp;height=1149",
              "enclosure": {
                  "link": "https://live-production.wcms.abc-cdn.net.au/f4337a3fa27b6a33742733f2bfca103d?impolicy=wcms_crop_resize&amp;cropH=1125&amp;cropW=2000&amp;xPos=0&amp;yPos=0&amp;width=862&amp;height=485",
                  "type": "image/jpeg",
                  "thumbnail": "https://live-production.wcms.abc-cdn.net.au/f4337a3fa27b6a33742733f2bfca103d?impolicy=wcms_crop_resize&amp;cropH=1127&amp;cropW=845&amp;xPos=628&amp;yPos=0&amp;width=862&amp;height=1149"
              }
          }]
  """.data(using: .utf8)!
    
    
    var _: AnyCancellable?
    
    let httpRequest = HTTPRequest.init(withURL: "", method: .get)
    
    var responseData: Data?
    
    _ = NetworkManager.fetchData(fromRequest: httpRequest)
      .sink { completion in
        switch completion {
          case .finished: break
          case .failure(let error):
            print(error.localizedDescription)
        }
      } receiveValue: { data in
        responseData = data
        print(responseData!)
      }
  }

}

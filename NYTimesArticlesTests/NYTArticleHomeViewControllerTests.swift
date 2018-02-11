//
//  NYTArticleHomeViewControllerTests.swift
//  NYTimesArticlesTests
//
//  Created by Prathap Dodla on 10/02/18.
//  Copyright © 2018 Suneelahammad Shaik. All rights reserved.
//

import XCTest
@testable import NYTimesArticles
import ObjectMapper

class NYTArticleHomeViewControllerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDataTask() {
        let semaphore = DispatchSemaphore(value: 0)
        let conf = URLSessionConfiguration.default
        let session = URLSession(configuration: conf, delegate: nil, delegateQueue: OperationQueue.main)
        let url = URL(string: "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=5aa997b8ed3a4482a69450dac3442f0f")
        let task:URLSessionTask = (session.dataTask(with: url!, completionHandler: {(data, response, error) -> Void in
            XCTAssertNil(error, "dataTaskWithURL error ", file: error as! StaticString)
            if (response is HTTPURLResponse) {
                let statusCode: Int? = (response as? HTTPURLResponse)?.statusCode
                XCTAssertEqual(statusCode, 200, "status code was not 200; was \(String(describing: statusCode))")
            }
            XCTAssert((data != nil), "data nil")
            // when all done, signal the semaphore
            semaphore.signal()
        })) as URLSessionTask
        task.resume()
        
        //Exception test
        //waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testArticalModel() {
        let articalModel = NYTArticleModel(JSON: ["section" : "Science","byline" : "Thomas","type" : "Article","title" : "Welocme to the test","abstract" : "Welocme to the abstract test","published_date" : "2018-02-11", "source" : "New York Times"])
        XCTAssertEqual(articalModel?.section, "Science")
        XCTAssertEqual(articalModel?.byLine, "Thomas")
        XCTAssertEqual(articalModel?.type, "Article")
        XCTAssertEqual(articalModel?.title, "Welocme to the test")
        XCTAssertEqual(articalModel?.abstract, "Welocme to the abstract test")
        XCTAssertEqual(articalModel?.publishDate, "2018-02-11")
        XCTAssertEqual(articalModel?.source, "New York Times")
        
        XCTAssertNotEqual(articalModel?.section, "Technology")
        XCTAssertNotEqual(articalModel?.byLine, "Cook")
        XCTAssertNotEqual(articalModel?.type, "Business")
        XCTAssertNotEqual(articalModel?.title, "Welocme to New York")
        XCTAssertNotEqual(articalModel?.abstract, "Welocme to the Hyderabad")
        XCTAssertNotEqual(articalModel?.publishDate, "2019-02")
        XCTAssertNotEqual(articalModel?.source, "America")
        
    }
    
    func testMediaModel() {
        let articalModel = NYTMediaModel(JSON: ["url" : "http://www.newyorktimes.com","format" : "square","height" : "300","width" : "300"])
        XCTAssertEqual(articalModel?.url, "http://www.newyorktimes.com")
        XCTAssertEqual(articalModel?.format, "square")
        XCTAssertEqual(articalModel?.height, "300")
        XCTAssertEqual(articalModel?.width, "300")
        
        XCTAssertNotEqual(articalModel?.url, "http://www.newyorktimes")
        XCTAssertNotEqual(articalModel?.format, "Rectangle")
        XCTAssertNotEqual(articalModel?.height, "100")
        XCTAssertNotEqual(articalModel?.width, "200")
    }
}

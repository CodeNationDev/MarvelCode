import XCTest
@testable import APIManager

final class APIManager: XCTestCase {
    func testRequestDefault() {
        var results:[Result]?
        let expectations = expectation(description: "Request Default")
        sharedMarvelAPIManager.retrieveCharacters(params: MarvelAPIParams()) { (items) in
            print(MarvelAPIParams())
            results = items
            expectations.fulfill()
        }
        waitForExpectations(timeout: 10) { (error) in
            XCTAssertNotNil(results)
            XCTAssertFalse(results!.isEmpty)
        }
    }
    
    func testRequestWithLimit10() {
        var results:[Result]?
        let expectations = expectation(description: "Request With Limit 10")
        sharedMarvelAPIManager.retrieveCharacters(params: MarvelAPIParams(limit: 10)) { (items) in
            print()
            results = items
            expectations.fulfill()
        }
        waitForExpectations(timeout: 10) { (error) in
            XCTAssertNotNil(results)
            XCTAssertFalse(results!.isEmpty)
            XCTAssertEqual(results!.count, 10)
        }
    }
    
    func testRequestWithPagination() {
        var results:[Result] = []
        let expectations = expectation(description: "Request With pagination")
        sharedMarvelAPIManager.retrieveCharacters(params: MarvelAPIParams(limit: 50, offset: 0)) { (items) in
            sharedMarvelAPIManager.retrieveCharacters(params: MarvelAPIParams(limit: 50, offset: 50)) { (items) in
                results.append(contentsOf: items)
                expectations.fulfill()
            }
            results = items
        }
        waitForExpectations(timeout: 10) { (error) in
            XCTAssertNotNil(results)
            XCTAssertFalse(results.isEmpty)
            XCTAssertEqual(results.count, 100)
        }
    }
    
    func testRequestValidHeroID() {
        let expectations = expectation(description: "Request Valid HeroID")
        var results:[Result] = []
        
        sharedMarvelAPIManager.retrieveCharacters(params: MarvelAPIParams(), heroID: 1011334) { (items) in
            results = items
            expectations.fulfill()
        }
        
        waitForExpectations(timeout: 10) { (error) in
            XCTAssertFalse(results.isEmpty)
            XCTAssertEqual(results.count, 1)
            XCTAssertEqual(results.first?.id!, 1011334)
        }
    }
    
    func testRequestInvalidHeroID() {
        let expectations = expectation(description: "Request Invalid HeroID")
        var results:[Result] = []
        
        sharedMarvelAPIManager.retrieveCharacters(params: MarvelAPIParams(), heroID: 1234567) { (items) in
            results = items
            expectations.fulfill()
        }
        
        waitForExpectations(timeout: 10) { (error) in
            XCTAssertTrue(results.isEmpty)
            XCTAssertEqual(results.count, 0)
        }
    }
    
    static var allTests = [
        ("testRequestDefault", testRequestDefault),
    ]
}


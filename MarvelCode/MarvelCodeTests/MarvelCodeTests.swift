//
import XCTest
@testable import MarvelCode

class MarvelCodeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: - MainViewModel
    func testViewModelDefault() {
        let viewModel = MainViewModel()
        let expectaction = expectation(description: "MainViewModel Default")
        viewModel.loadData { (finished) in
            XCTAssertTrue(finished)
            expectaction.fulfill()
        }
        waitForExpectations(timeout: 10) { (error) in
            XCTAssertNotNil(viewModel.results)
            XCTAssertFalse(viewModel.results.isEmpty)
        }
    }
    
    func testViewModelWithLimit() {
        let viewModel = MainViewModel()
        let expectaction = expectation(description: "MainViewModel with limit 50")
        viewModel.loadData(limit: 50, offset: 0) { (finished) in
            XCTAssertTrue(finished)
            expectaction.fulfill()
        }
        waitForExpectations(timeout: 10) { (error) in
            XCTAssertNotNil(viewModel.results)
            XCTAssertEqual(viewModel.results.count, 50)
        }
    }
    
    func testViewModelDefaulPagination() {
        let viewModel = MainViewModel()
        let expectaction = expectation(description: "MainViewModel with limit 50")
        viewModel.loadData(limit: 50, offset: 0) { (finished) in
            viewModel.loadData(limit: 50, offset: 50) { (finished) in
                XCTAssertTrue(finished)
                expectaction.fulfill()
            }
            XCTAssertTrue(finished)
        }
        waitForExpectations(timeout: 10) { (error) in
            XCTAssertNotNil(viewModel.results)
            XCTAssertEqual(viewModel.results.count, 100)
        }
    }
    
    // MARK: - CharacterDetailViewModel
    func testCharacterDetailValidID() throws {
        let viewModel = CharacterDetailViewModel()
        let expectaction = expectation(description: "CharacterDetailViewModel with valid ID")
        
        viewModel.loadData(heroID: 1011334) { finished in
            XCTAssertTrue(finished)
            expectaction.fulfill()
        }
        waitForExpectations(timeout: 10) { error in
            XCTAssertNotNil(viewModel.hero)
            XCTAssertEqual(viewModel.hero?.id!, 1011334)
        }
    }
    
    func testCharacterDetailInvalidID() throws {
        let viewModel = CharacterDetailViewModel()
        let expectaction = expectation(description: "CharacterDetailViewModel with invalid ID")
        viewModel.loadData(heroID: 12345) { finished in
            XCTAssertFalse(finished)
            expectaction.fulfill()
        }
        waitForExpectations(timeout: 10) { error in
            XCTAssertNil(viewModel.hero)
        }
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of herez.
        }
    }
}

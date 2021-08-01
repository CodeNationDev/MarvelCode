import XCTest
@testable import MarvelUIKitManager

final class MarvelUIKitManagerTest: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testLoadImage() {
        let imageview = UIImageView()
        let expectaction = expectation(description: "Load image from URL")
        imageview.load(url: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", size: .portait_uncanny, mime: "jpg") { (result) -> (Void) in
            XCTAssertTrue(result)
            expectaction.fulfill()
        }
        waitForExpectations(timeout: 10) { (error) in
            XCTAssertNotNil(imageview.image)
        }
    }
}

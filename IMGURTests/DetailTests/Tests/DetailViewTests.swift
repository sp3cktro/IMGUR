import XCTest
@testable import IMGUR

class DetailViewTests: XCTestCase {
    
    var sut: DetailViewController!
    
    override func setUp() {
        // given
        sut = DetailViewController.instantiate(from: "Main")
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func testDetailImageViewExists() {
        //when
        sut.loadViewIfNeeded()
        //then
        XCTAssertNotNil(sut.imageView)
    }
    
}

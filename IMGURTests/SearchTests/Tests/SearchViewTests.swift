import XCTest
@testable import IMGUR

class SearchViewTests: XCTestCase {
    
    var sut: SearchPopUpViewController!
    
    override func setUp() {
        // given
        sut = SearchPopUpViewController.instantiateXib(from: ViewIdentifiers.searchViewControllerId.rawValue)
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func testSearchViewExists() {
        // when
        sut.loadViewIfNeeded()
        // then
        XCTAssertNotNil(sut?.searchView)
    }
    
    func testKeywordTextFieldExists() {
        // when
        sut.loadViewIfNeeded()
        // then
        XCTAssertNotNil(sut?.keywordTextField)
    }
    
    func testSearchButtonExists() {
        // when
        sut.loadViewIfNeeded()
        // then
        XCTAssertNotNil(sut?.searchButton)
    }
    
    func testCancelButtonExists() {
        // when
        sut.loadViewIfNeeded()
        // then
        XCTAssertNotNil(sut?.cancelButton)
    }
    
    func testBlurEffectIsSubviewed() {
        // when
        sut.loadViewIfNeeded()
        // then
        guard let blur = sut?.view.subviews[0] else {
            XCTFail()
            return
        }
        XCTAssertNotNil(blur as? UIVisualEffectView)
    }
}

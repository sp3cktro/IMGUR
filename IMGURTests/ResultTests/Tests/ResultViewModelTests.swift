import XCTest
@testable import IMGUR

class ResultViewModelTests: XCTestCase {
    
    var sut: ResultViewModel!
    
    override func setUp() {
        sut = ResultViewModel()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func testUpdateModelSuccessful() {
        // given
        let dummyModel = [Hit(largeImageURL: "test", tags: "test", user: "test", userImageURL: "test", previewURL: "test")]
        let dummyIndex = 0
        // when
        sut.updateModel(newModel: dummyModel)
        // then
        XCTAssertEqual(dummyModel[dummyIndex].tags, sut.hits?[dummyIndex].tags)
        XCTAssertEqual(dummyModel[dummyIndex].user, sut.hits?[dummyIndex].user)
        XCTAssertEqual(dummyModel[dummyIndex].largeImageURL, sut.hits?[dummyIndex].largeImageURL)
    }
}

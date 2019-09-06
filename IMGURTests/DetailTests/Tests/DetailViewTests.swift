import XCTest
@testable import IMGUR

class DetailViewTests: XCTestCase {
    
    var sut: DetailViewController!
    var viewModel: MockDetailViewModel!
    
    override func setUp() {
        viewModel = MockDetailViewModel()
        sut = DetailViewController.instantiate(from: "Main")
        sut.viewModel = viewModel
    }
    
    override func tearDown() {
        sut = nil
        viewModel = nil
    }
    
    func testSetImageWasCalled() {
        // given
        let initialCount = viewModel.setImageCalled
        // when
        sut.setImage(from: nil)
        // then
        XCTAssertEqual(initialCount + 1, viewModel.setImageCalled)
    }
}

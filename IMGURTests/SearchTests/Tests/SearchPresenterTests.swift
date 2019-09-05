import XCTest
@testable import IMGUR

class SearchPresenterTests: XCTestCase {
    
    var sut: SearchPresenter!
    var viewController: MockSearchView!
    var router: MockSearchRouter!
    var interactor: MockSearchInteractor!
    
    override func setUp() {
        // given
        viewController = MockSearchView()
        router = MockSearchRouter()
        interactor = MockSearchInteractor()
        guard let viewController = viewController, let router = router, let interactor = interactor else { return }
        sut = SearchPresenter(viewController: viewController, router: router, interactor: interactor)
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func testGetImagesCalled() {
        // given
        let dummyKeyword = "Dummy"
        let initialCount = interactor.getImagesCalled
        // when
        sut.getImages(for: dummyKeyword)
        // then
        XCTAssertEqual(initialCount, 0)
        XCTAssertEqual(interactor.getImagesCalled, initialCount + 1)
    }
    
    func testDismissSearchViewCalled() {
        // given
        let initialCount = router.dismissSearchViewControllerCalled
        // when
        sut.cancelTapped()
        // then
        XCTAssertEqual(initialCount, 0)
        XCTAssertEqual(router.dismissSearchViewControllerCalled, initialCount + 1)
    }
}

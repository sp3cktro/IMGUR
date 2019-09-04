import XCTest
@testable import IMGUR

class ResultPresenterTests: XCTestCase {
    var view: MockItemsView!
    var interactor: MockItemsInteractor!
    var router: MockItemsRouter!
    
    var sut: ItemsPresenter!
    
    override func setUp() {
        view = MockItemsView()
        interactor = MockItemsInteractor()
        router = MockItemsRouter()
        
        guard let view = view, let interactor = interactor, let router = router else { return }
        sut = ItemsPresenter(viewController: view, interactor: interactor, router: router)
    }
    
    override func tearDown() {
        super.tearDown()
        view = nil
        interactor = nil
        sut = nil
    }
    
    func testFetchItemsCalled() {
        // given
        let initialCount = interactor.fetchItemsCalled
        // when
        sut.fillTable()
        // then
        XCTAssertEqual(initialCount, 0)
        XCTAssertEqual(interactor.fetchItemsCalled, initialCount + 1)
    }
}

import XCTest
@testable import IMGUR

class ResultViewTests: XCTestCase {
    
    var sut: ItemsTableViewController!
    var presenter: MockItemsPresenter!
    
    override func setUp() {
        // given
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let sut = storyboard.instantiateViewController(withIdentifier: "ItemsTableViewController") as? ItemsTableViewController else { return }
        presenter = MockItemsPresenter()
        self.sut = sut
        
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testSearchButtonExists() {
        // when
        sut.loadViewIfNeeded()
        // then
        XCTAssertNotNil(sut?.navigationItem.rightBarButtonItem)
    }
    
    func testFillTableCalled() {
        // given
        let initialCount = presenter.fillTableCalled
        // when
        self.sut.setup(presenter: presenter)
        // then
        XCTAssertEqual(initialCount, 0)
        XCTAssertEqual(presenter.fillTableCalled, initialCount + 1)
    }
    
    func testTableViewExists() {
        // when
        sut.loadViewIfNeeded()
        // then
        XCTAssertNotNil(sut?.tableView)
    }
    
    func testCustomItemCellCanInstance() {
        // given
        let dummyIndexPath = IndexPath(row: 0, section: 0)
        // when
        sut.loadViewIfNeeded()
        let itemCell = UINib(nibName: ViewIdentifiers.itemCellId.rawValue, bundle: nil)
        sut.tableView.register(itemCell, forCellReuseIdentifier: ViewIdentifiers.itemCellId.rawValue)
        // then
        XCTAssertNotNil(sut.tableView(sut.tableView, cellForRowAt: dummyIndexPath) as? ItemCell)
    }
    
    func testTableViewCellLabelsShowsCorrectInformation() {
        // given
        let dummyHit = Hit(largeImageURL: "fakeURL", tags: "tag", user: "user", userImageURL: "url", previewURL: "previewURL")
        let dummyPixabay = Pixabay(totalHits: 1, hits: [dummyHit])
        let dummyIndexPath = IndexPath(row: 0, section: 0)
        // when
        sut.loadViewIfNeeded()
        sut.items = dummyPixabay
        
        guard let cell = sut.tableView(sut.tableView, cellForRowAt: dummyIndexPath) as? ItemCell else {
            XCTFail()
            return
        }
        // then
        XCTAssertEqual(cell.itemTitle?.text, dummyHit.tags)
        XCTAssertEqual(cell.userName?.text, dummyHit.user)
    }
}

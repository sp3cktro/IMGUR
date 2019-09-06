import XCTest
@testable import IMGUR

class SearchViewModelTests: XCTestCase {
    
    var sut: SearchViewModel!
    var parentViewModel: MockResultViewModel!
    
    override func setUp() {
        parentViewModel = MockResultViewModel()
        sut = SearchViewModel(parentViewModel: parentViewModel)
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func testSearchKeyword() {
        // given
        let dummyKeyword = "test"
        let dummyData: Data? = getDataFromJSON(fileName: "default")
        let dummyResponse = URLResponse()
        let dummyError: Error? = nil
        let dummyHits = [Hit(largeImageURL: "https://pixabay.com/get/54e2dc424353aa14f6da8c7dda79367d1136dce150536c4870297cd2954dc059bb_1280.jpg", tags: "gear, bicycle, chain", user: "JarkkoManty", userImageURL: "", previewURL: "")]
        let dummyIndex = 0
        // when
        sut.session = StubURLSession(data: dummyData, response: dummyResponse, error: dummyError)
        sut.search(dummyKeyword)
        // then
        XCTAssertEqual(parentViewModel?.hits?[dummyIndex].tags, dummyHits[dummyIndex].tags)
    }
    
    func testSearchKeywordCalledOnlyOnce() {
        // given
        let dummyKeyword = "test"
        let dummyData: Data? = getDataFromJSON(fileName: "default")
        let dummyResponse = URLResponse()
        let dummyError: Error? = nil
        let initialCount = parentViewModel.updateModelCalled
        // when
        sut.session = StubURLSession(data: dummyData, response: dummyResponse, error: dummyError)
        sut.search(dummyKeyword)
        // then
        XCTAssertEqual(parentViewModel?.updateModelCalled, initialCount + 1)
    }
    
    
    //MARK: - Auxiliar functions
    func getDataFromJSON(fileName: String) -> Data? {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json"), let data = try? Data(contentsOf: url) else {
            return nil
        }
        return data
    }
}

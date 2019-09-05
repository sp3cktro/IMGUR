import XCTest
@testable import IMGUR

class ServiceLayerTests: XCTestCase {
    
    var session: StubURLSession!
    var expectation: XCTestExpectation!
    var dummyData: Data?
    var dummyResponse: URLResponse?
    var dummyError: Error?
    
    override func setUp() {
        expectation = XCTestExpectation(description: "Data not nil")
        dummyResponse = URLResponse()
    }
    
    override func tearDown() {
        expectation = nil
    }
    
    func testRequestWithCorrectDataSuccess() {
        dummyData = getDataFromJSON(fileName: "default")
        session = StubURLSession(data: dummyData, response: dummyResponse, error: dummyError)
        ServiceLayer.request(session: session, router: ImageRouter.getImages("Test")) { (result: Result<Pixabay, Error>) in
            switch result {
            case .success:
                XCTAssertTrue(true)
            case .failure:
                XCTFail()
            }
        }
    }
    
    func testRequestWithIncorrectDataFailure() {
        dummyData = getDataFromJSON(fileName: "badJSON")
        session = StubURLSession(data: dummyData, response: dummyResponse, error: dummyError)
        ServiceLayer.request(session: session, router: ImageRouter.getImages("Test")) { (result: Result<Pixabay, Error>) in
            switch result {
            case .success:
                XCTFail()
            case .failure:
                XCTAssertTrue(true)
            }
        }
    }
    
    
    //MARK: - Auxiliar functions
    func getDataFromJSON(fileName: String) -> Data? {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json"), let data = try? Data(contentsOf: url) else {
            return nil
        }
        return data
    }
}

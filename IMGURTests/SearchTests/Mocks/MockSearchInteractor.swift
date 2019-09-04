import Foundation

@testable import IMGUR

class MockSearchInteractor: SearchInteractorProtocol {
    
    var getImagesCalled = 0
    
    func getImages(for keyword: String, completionHandler: @escaping (Result<Pixabay, FetchError>) -> ()) {
        getImagesCalled += 1
    }
}

import Foundation

@testable import IMGUR

class MockSearchInteractor: SearchInteractorProtocol {
    
    var getImagesCalled = 0
    
    func getImages(for keyword: String, completionHandler: @escaping (Result<Pixabay, Error>) -> ()) {
        getImagesCalled += 1
    }
}

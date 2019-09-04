import Foundation

@testable import IMGUR

class MockSearchPresenter: SearchPresenterProtocol {
    
    var getImagesCalled = 0
    var cancelTappedCalled = 0
    
    func getImages(for keyword: String) {
        getImagesCalled += 1
    }
    
    func cancelTapped() {
        cancelTappedCalled += 1
    }
}

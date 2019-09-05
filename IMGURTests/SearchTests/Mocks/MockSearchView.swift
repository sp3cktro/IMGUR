import Foundation

@testable import IMGUR

class MockSearchView: SearchViewControllerProtocol {
    
    var dismissSearchViewControllerCalled = 0
    
    func dismissSearchViewController() {
        dismissSearchViewControllerCalled += 1
    }
}

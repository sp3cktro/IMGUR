import Foundation

@testable import IMGUR

class MockItemsInteractor: ItemsInteractorProtocol {
    
    var fetchItemsCalled = false
    
    func fetchItems(completionHandler: @escaping (Result<Pixabay, FetchError>) -> ()) {
        fetchItemsCalled = true
    }
}

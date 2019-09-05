import Foundation

@testable import IMGUR

class MockItemsInteractor: ItemsInteractorProtocol {
    
    var fetchItemsCalled = 0
    
    func fetchItems(completionHandler: @escaping (Result<Pixabay, FetchError>) -> ()) {
        fetchItemsCalled += 1
    }
}

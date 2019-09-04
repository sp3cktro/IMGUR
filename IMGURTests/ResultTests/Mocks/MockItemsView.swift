import Foundation

@testable import IMGUR

class MockItemsView: ItemsViewControllerProtocol {
    var items: Pixabay?
    
    var fillTableCalled = 0
    
    func fillTable(with itemsFetched: Pixabay) {
        fillTableCalled += 1
    }
}

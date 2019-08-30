import Foundation

@testable import IMGUR

class MockItemsView: ItemsViewControllerProtocol {
    
    var fillTableCalled = false
    
    func fillTable(with itemsFetched: Pixabay) {
        fillTableCalled = true
    }
}

import Foundation

@testable import IMGUR

class MockItemsPresenter: ItemsPresenterProtocol {
    
    var setupCalled = false
    var fillTableCalled = false
    
    func setup(viewController: ItemsViewControllerProtocol) {
        setupCalled = true
    }
    
    func fillTable() {
        fillTableCalled = true
    }
}


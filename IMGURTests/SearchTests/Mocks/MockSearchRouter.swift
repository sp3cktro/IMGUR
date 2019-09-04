import Foundation

@testable import IMGUR

class MockSearchRouter: SearchRouterProtocol {
    
    var itemsRouter: ItemsRouterProtocol?
    var viewController: SearchViewControllerProtocol?
    
    var updateTableCalled = 0
    var dismissSearchViewControllerCalled = 0
    
    func updateTable(info: Pixabay?) {
        updateTableCalled += 1
    }
    
    func dismissSearchViewController() {
        dismissSearchViewControllerCalled += 1
    }
}

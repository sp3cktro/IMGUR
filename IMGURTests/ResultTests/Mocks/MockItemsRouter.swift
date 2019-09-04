import UIKit

@testable import IMGUR

class MockItemsRouter: ItemsRouterProtocol {
    
    var resultViewController: ItemsViewControllerProtocol?
    
    var presentDetailViewCalled = 0
    var didRecieveUpdateCalled = 0
    var presentSearchViewCalled = 0
    
    func presentDetailView(navigationController: UINavigationController?, image: URL?) {
        presentDetailViewCalled += 1
    }
    
    func presentSearchView(navigationController: UINavigationController?) {
        presentSearchViewCalled += 1
    }
    
    func didRecieveUpdate(info: Pixabay?) {
        didRecieveUpdateCalled += 1
    }
}

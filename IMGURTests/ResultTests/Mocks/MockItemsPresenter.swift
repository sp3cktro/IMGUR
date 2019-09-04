import Foundation

@testable import IMGUR

class MockItemsPresenter: ItemsPresenterProtocol {
    
    var setupCalled = 0
    var fillTableCalled = 0
    var presentDetailViewCalled = 0
    var presentSearchPopUpViewCalled = 0
    
    func setup(viewController: ItemsViewControllerProtocol) {
        setupCalled += 1
    }
    
    func fillTable() {
        fillTableCalled += 1
    }
    
    func presentDetailView(image: String?) {
        presentDetailViewCalled += 1
    }
    
    func presentSearchPopUpView() {
        presentSearchPopUpViewCalled += 1
    }
}


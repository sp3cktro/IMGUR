import UIKit

class ItemsPresenter: ItemsPresenterProtocol {
    
    private var viewController: ItemsViewControllerProtocol?
    private var interactor: ItemsInteractorProtocol?
    private var router: ItemsRouterProtocol?
    
    func fillTable() {
        interactor?.fetchItems { [weak self] result in
            switch result {
            case .success(let model):
                self?.viewController?.fillTable(with: model)
            case .failure:
                break
            }
            
        }
    }
    
    func setup(viewController: ItemsViewControllerProtocol) {
        self.viewController = viewController
        interactor = ItemsInteractor()
        router = ItemsRouter()
    }
    
    func presentDetailView() {
        guard let itemsViewController = viewController as? ItemsTableViewController else { return }
        router?.presentDetailView(navigationController: itemsViewController.navigationController)
    }
}

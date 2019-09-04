import UIKit

class ItemsPresenter: ItemsPresenterProtocol {
    
    var viewController: ItemsViewControllerProtocol?
    var interactor: ItemsInteractorProtocol?
    var router: ItemsRouterProtocol?
    
    init(viewController: ItemsViewControllerProtocol?, interactor: ItemsInteractorProtocol = ItemsInteractor(), router: ItemsRouterProtocol = ItemsRouter()) {
        self.viewController = viewController
        self.interactor = interactor
        self.router = router
        self.router?.resultViewController = viewController
    }
    
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
    
    func presentDetailView(image: String?) {
        guard let itemsViewController = viewController as? ItemsTableViewController else { return }
        guard let image = image, let imageURL = URL(string: image) else { return }
        router?.presentDetailView(navigationController: itemsViewController.navigationController, image: imageURL)
    }
    
    func presentSearchPopUpView() {
        guard let itemsViewController = viewController as? ItemsTableViewController else { return }
        router?.presentSearchView(navigationController: itemsViewController.navigationController)
    }
}

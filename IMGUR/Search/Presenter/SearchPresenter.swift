import Foundation

class SearchPresenter: SearchPresenterProtocol {
    
    //MARK: - Architecture variables
    var viewController: SearchViewControllerProtocol?
    var router: SearchRouterProtocol?
    var interactor: SearchInteractorProtocol?
    
    init(viewController: SearchViewControllerProtocol?, router: SearchRouterProtocol = SearchRouter(), interactor: SearchInteractorProtocol = SearchInteractor()) {
        self.viewController = viewController
        self.router = router
        self.interactor = interactor
        self.router?.viewController = viewController
    }
    
    func getImages(for keyword: String) {
        interactor?.getImages(for: keyword) { [weak self] result in
            switch result {
            case .success(let model):
                self?.router?.updateTable(info: model)
            case .failure:
                break
            }
        }
    }
    
    func cancelTapped() {
        router?.dismissSearchViewController()
    }
}

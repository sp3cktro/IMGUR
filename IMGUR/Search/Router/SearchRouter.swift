import Foundation

class SearchRouter: SearchRouterProtocol {
    
    weak var itemsRouter: ItemsRouterProtocol?
    weak var viewController: SearchViewControllerProtocol?
    
    func updateTable(info: Pixabay?) {
        itemsRouter?.didRecieveUpdate(info: info)
        dismissSearchViewController()
    }
    
    func dismissSearchViewController() {
        viewController?.dismissSearchViewController()
    }
}

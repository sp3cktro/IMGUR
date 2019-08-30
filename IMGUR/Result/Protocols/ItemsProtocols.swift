import UIKit

protocol ItemsPresenterProtocol {
    func setup(viewController: ItemsViewControllerProtocol)
    func fillTable()
    func presentDetailView()
}

protocol ItemsInteractorProtocol {
    func fetchItems(completionHandler: @escaping (Result<Pixabay,FetchError>) -> ()) 
}

protocol ItemsRouterProtocol {
    func presentDetailView(navigationController: UINavigationController?)
}

protocol ItemsViewControllerProtocol {
    func fillTable(with itemsFetched: Pixabay)
}

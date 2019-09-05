import UIKit

protocol ItemsPresenterProtocol {
    func fillTable()
    func presentDetailView(image: String?)
    func presentSearchPopUpView()
}

protocol ItemsInteractorProtocol {
    func fetchItems(completionHandler: @escaping (Result<Pixabay,FetchError>) -> ()) 
}

protocol ItemsRouterProtocol: class {
    var resultViewController: ItemsViewControllerProtocol? {get set}
    
    func presentDetailView(navigationController: UINavigationController?, image: URL?)
    func presentSearchView(navigationController: UINavigationController?)
    func didRecieveUpdate(info: Pixabay?)
}

protocol ItemsViewControllerProtocol: class {
    var items: Pixabay? {get set}
    
    func fillTable(with itemsFetched: Pixabay)
}

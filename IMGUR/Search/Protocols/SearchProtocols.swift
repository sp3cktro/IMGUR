import Foundation

protocol SearchViewControllerProtocol: class {
    func dismissSearchViewController()
}

protocol SearchInteractorProtocol {
    func getImages(for keyword: String, completionHandler: @escaping (Result<Pixabay,FetchError>) -> ())
}

protocol SearchPresenterProtocol {
    func getImages(for keyword: String)
    func cancelTapped()
}

protocol SearchRouterProtocol {
    var itemsRouter: ItemsRouterProtocol? {get set}
    var viewController: SearchViewControllerProtocol? {get set}
    func updateTable(info: Pixabay?)
    func dismissSearchViewController()
}

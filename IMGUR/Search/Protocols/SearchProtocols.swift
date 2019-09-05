import Foundation

protocol SearchViewControllerProtocol: class {
    func dismissSearchViewController()
}

protocol SearchInteractorProtocol {
    func getImages(for keyword: String, completionHandler: @escaping (Result<Pixabay,Error>) -> ())
}

protocol SearchPresenterProtocol {
    func getImages(for keyword: String)
    func cancelTapped()
    func passRouter(router: ItemsRouterProtocol)
}

protocol SearchRouterProtocol {
    var itemsRouter: ItemsRouterProtocol? {get set}
    var viewController: SearchViewControllerProtocol? {get set}
    func updateTable(info: Pixabay?)
    func dismissSearchViewController()
}

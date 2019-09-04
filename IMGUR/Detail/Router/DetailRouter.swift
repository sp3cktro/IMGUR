import UIKit

class DetailRouter: DetailRouterProtocol {
    
    static func createDetailModule(imageURL: URL?) -> UIViewController? {
        guard let detailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return UIViewController() }
        
        let presenter: DetailPresenter = DetailPresenter()
        let interactor: DetailInteractor = DetailInteractor()
        let router: DetailRouter = DetailRouter()
        
        interactor.presenter = presenter
        
        presenter.viewController = detailViewController
        presenter.router = router
        presenter.interactor = interactor
        
        detailViewController.presenter = presenter
        
        detailViewController.imageURL = imageURL
        
        return detailViewController
    }
}

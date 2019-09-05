import UIKit

class ItemsRouter: ItemsRouterProtocol {
    
    weak var resultViewController: ItemsViewControllerProtocol?
    
    func didRecieveUpdate(info: Pixabay?) {
        resultViewController?.items = info
    }
    
    func presentDetailView(navigationController: UINavigationController?, image: URL?) {
        guard let detailViewController = DetailRouter.createDetailModule(imageURL: image) as? DetailViewController else { return }
        
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func presentSearchView(navigationController: UINavigationController?) {
        let vc = SearchPopUpViewController.instantiateXib(from: "SearchPopUpViewController")
        vc.modalPresentationStyle = .overCurrentContext
        navigationController?.present(vc, animated: true)
        vc.passRouter(itemsRouter: self)
    }
}

import UIKit

class ItemsRouter: ItemsRouterProtocol {
    
    func presentDetailView(navigationController: UINavigationController?) {
        guard let detailViewController = DetailRouter.createDetailModule() as? DetailViewController else { return }
        
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

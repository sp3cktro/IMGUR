import UIKit

protocol Storyboarded {
    static func instantiate(from storyboard: String) -> Self
    static func instantiateXib(from xib: String) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(from storyboard: String) -> Self {
        let identifier = String(describing: self)
        let storyboard = UIStoryboard(name: storyboard, bundle: Bundle.main)
        guard let controller = storyboard.instantiateViewController(withIdentifier: identifier) as? Self else {
            fatalError("Controller wasn't found")
        }
        return controller
    }
    
    static func instantiateXib(from xib: String) -> Self {
        let viewController = Self(nibName: xib, bundle: Bundle.main)
        return viewController
    }
}

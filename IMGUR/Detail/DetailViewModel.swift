import UIKit

protocol DetailViewModelProtocol {
    var image: Observable<UIImage> {get set}
    func setImage(from urlString: String?)
}

class DetailViewModel: DetailViewModelProtocol {
    var image: Observable<UIImage> = Observable(UIImage())
    
    func setImage(from urlString: String?) {
        guard let urlString = urlString, let url = URL(string: urlString) else { return }
        if let data = try? Data(contentsOf: url) {
            if let image = UIImage(data: data) {
                self.image.value = image
            }
        }
    }
}

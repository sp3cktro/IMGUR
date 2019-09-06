import UIKit

protocol ResultViewModelProtocol: class {
    var pixabay: Pixabay? {get set}
    var delegate: ResultViewDelegate? {get set}
    var hits: [Hit]? {get set}
    func updateModel(newModel: [Hit])
}

protocol ResultViewDelegate: class {
    func reloadDataInView()
}

class ResultViewModel: ResultViewModelProtocol {
    var pixabay: Pixabay?
    
    var hits: [Hit]?
    var delegate: ResultViewDelegate?
    
    func updateModel(newModel: [Hit]) {
        hits = newModel
        delegate?.reloadDataInView()
    }
    
    func requestPhoto(from urlString: String?) -> UIImage? {
        guard let url = urlString, let urlPhoto = URL(string: url) else { return nil }
        if let data = try? Data(contentsOf: urlPhoto) {
            if let image = UIImage(data: data) {
                return image
            }
            return nil
        }
        return nil
    }
}

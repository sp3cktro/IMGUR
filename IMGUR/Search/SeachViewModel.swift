import Foundation

protocol SearchViewModelProtocol {
    var parentViewModel: ResultViewModelProtocol? {get set}
    func search(_ keyword: String)
}

class SearchViewModel: SearchViewModelProtocol {
    
    weak var parentViewModel: ResultViewModelProtocol?
    
    init(parentViewModel: ResultViewModelProtocol?) {
        self.parentViewModel = parentViewModel
    }
    
    func search(_ keyword: String) {
        ServiceLayer.request(router: ImageRouter.getImages(keyword)) { [weak self] (result: Result<Pixabay, Error>) in
            switch result {
            case .success(let newModel):
                self?.parentViewModel?.updateModel(newModel: newModel.hits)
            case .failure(let error):
                break
            }
        }
    }
}

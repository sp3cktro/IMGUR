import Foundation

protocol SearchViewModelProtocol {
    var parentViewModel: ResultViewModelProtocol? {get set}
    func search(_ keyword: String)
}

class SearchViewModel: SearchViewModelProtocol {
    
    weak var parentViewModel: ResultViewModelProtocol?
    var session: URLSessionProtocol = URLSession(configuration: .default)
    
    init(parentViewModel: ResultViewModelProtocol?) {
        self.parentViewModel = parentViewModel
    }
    
    func search(_ keyword: String) {
        ServiceLayer.request(session: session, router: ImageRouter.getImages(keyword)) { [weak self] (result: Result<Pixabay, Error>) in
            switch result {
            case .success(let newModel):
                self?.parentViewModel?.updateModel(newModel: newModel.hits)
            case .failure:
                break
            }
        }
    }
}

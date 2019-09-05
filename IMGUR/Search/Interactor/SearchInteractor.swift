import Foundation

class SearchInteractor: SearchInteractorProtocol {
    func getImages(for keyword: String, completionHandler: @escaping (Result<Pixabay, Error>) -> ()) {
        ServiceLayer.request(router: ImageRouter.getImages(keyword)) { (result: Result<Pixabay, Error>) in
            switch result {
            case .success(let pixabay):
                completionHandler(.success(pixabay))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}

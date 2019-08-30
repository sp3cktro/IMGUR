import Foundation

class ItemsInteractor: ItemsInteractorProtocol {
    
    //MARK: - Class variables
    private var presenter: ItemsPresenterProtocol?
    
    //MARK: - Class Methods
    func fetchItems(completionHandler: @escaping (Result<Pixabay,FetchError>) -> ()) {
        let jsonDecoder = JSONDecoder()
        guard let url = Bundle.main.url(forResource: "default", withExtension: "json"), let data = try? Data(contentsOf: url) else {
            completionHandler(.failure(.badURL))
            return
        }
        guard let decodedJSON = try? jsonDecoder.decode(Pixabay.self, from: data) else {
            completionHandler(.failure(.badDecoded))
            return
        }
        completionHandler(.success(decodedJSON))
    }
}

import Foundation

class SearchInteractor: SearchInteractorProtocol {
    func getImages(for keyword: String, completionHandler: @escaping (Result<Pixabay, FetchError>) -> ()) {
        //TODO: Use the networking layer for get the information.
    }
}

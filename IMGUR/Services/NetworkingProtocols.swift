import Foundation

protocol URLSessionProtocol {
    func dataTask(with url: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> ()) -> URLSessionDataTask
}

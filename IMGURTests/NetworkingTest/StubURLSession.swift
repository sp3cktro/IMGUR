import Foundation
@testable import IMGUR

class StubURLSession: URLSessionProtocol {
    
    var data: Data?
    var response: URLResponse?
    var error: Error?
    
    init(data: Data?, response: URLResponse?, error: Error?) {
        self.data = data
        self.response = response
        self.error = error
    }
    
    func dataTask(with url: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> ()) -> URLSessionDataTask {
        defer { completionHandler(data, response, error) }
        return StubURLSessionDataTask(completionHandler: completionHandler)
    }
}

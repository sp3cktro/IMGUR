import Foundation
@testable import IMGUR

class StubURLSessionDataTask: URLSessionDataTask {
    var completionHandler: (Data?, URLResponse?, Error?) -> ()
    
    init(completionHandler: @escaping (Data?, URLResponse?, Error?) -> ()) {
        self.completionHandler = completionHandler
    }
    
    override func resume() {
        debugPrint("Resume_local")
    }
}

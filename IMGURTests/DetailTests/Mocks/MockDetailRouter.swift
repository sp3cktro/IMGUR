import UIKit

@testable import IMGUR

class MockDetailRouter: DetailRouterProtocol {
    var createDetailModuleCalled = false
    
    static func createDetailModule(imageURL: URL?) -> UIViewController? {
        return nil
    }
}

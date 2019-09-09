import UIKit
@testable import IMGUR

class MockDetailViewModel: DetailViewModelProtocol {
    var image: Observable<UIImage> = Observable(UIImage())
    
    var setImageCalled = 0
    
    func setImage(from urlString: String?) {
        setImageCalled += 1
    }
}

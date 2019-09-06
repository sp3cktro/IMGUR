import Foundation
@testable import IMGUR

class MockResultViewModel: ResultViewModelProtocol {
    var pixabay: Pixabay?
    var delegate: ResultViewDelegate?
    var hits: [Hit]?
    
    var updateModelCalled = 0
    
    func updateModel(newModel: [Hit]) {
        updateModelCalled += 1
        hits = newModel
    }
    
}

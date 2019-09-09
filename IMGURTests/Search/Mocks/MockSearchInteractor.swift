//
//  MockSearchInteractor.swift
//  IMGURTests
//
//  Created by Jordy Xavier Pazaran Reyes on 9/5/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import Foundation
@testable import IMGUR

class MockSearchIntercator: SearchBusinessLogic, SearchDataStore {
    var keyword: String = ""
    var getKeywordCalled = false
    
    func getKeyword(request: SearchLogicModel.Request) {
        getKeywordCalled = true
    }
    
}

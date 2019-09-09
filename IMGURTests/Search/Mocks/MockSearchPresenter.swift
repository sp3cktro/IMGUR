//
//  MockSearchPresenter.swift
//  IMGURTests
//
//  Created by Jordy Xavier Pazaran Reyes on 9/5/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import Foundation
@testable import IMGUR

class MockSearchPresenter: SearchPresentationLogic {
    var presentTellItemCalled = false
    
    func presentTellItemsTable(response: SearchLogicModel.Response) {
        presentTellItemCalled = true
    }
}

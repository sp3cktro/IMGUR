//
//  MockitemListPresenter.swift
//  IMGURTests
//
//  Created by Jordy Xavier Pazaran Reyes on 9/4/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import Foundation
@testable import IMGUR

class MockItemsListPresenter: ItemPresentationLogic {
    var presentItemsCalled = false
    var presentTellDetailCalled = false
    
    func presentItems(response: ItemsLogicModel.Response.Pixabay) {
        presentItemsCalled = true
    }
    
    func presentTellDetail(reponse: ItemsLogicModel.Response.Pixabay) {
        presentTellDetailCalled = true
    }
}

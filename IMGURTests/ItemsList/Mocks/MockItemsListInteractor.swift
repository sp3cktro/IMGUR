//
//  MockItemListInteractor.swift
//  IMGURTests
//
//  Created by Jordy Xavier Pazaran Reyes on 9/4/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import Foundation
@testable import IMGUR

class MockItemsListInteractor: ItemBusinesslogic, ItemDataStore {
    var keyword: String = ""
    var item: ItemsLogicModel.Response.Pixabay = ItemsLogicModel.Response.Pixabay(totalHits: 0, hits: [])
    
    var showItemsCalled = false
    var tellDetailCalled = false
    
    func showItems(request: ItemsLogicModel.Request) {
        showItemsCalled = true
    }
    
    func tellDetail(request: ItemsLogicModel.Response.Pixabay) {
        tellDetailCalled = true
    }
}

//
//  MockSearchRouter.swift
//  IMGURTests
//
//  Created by Jordy Xavier Pazaran Reyes on 9/5/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import Foundation
@testable import IMGUR

class MockSearchRouter: SearchRoutingLogic, SearchDataPassing {

    var dataStore: SearchDataStore?
    var routeToItemsListSearchButtonCalled = false
    var routeToItemListCancelButtonCalled = false
    
    func routeToItemsListSearchButton() {
        routeToItemsListSearchButtonCalled = true
    }
    
    func routeToItemsListCancelButton() {
        routeToItemListCancelButtonCalled = true
    }
}

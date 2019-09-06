//
//  MockitemListRouter.swift
//  IMGURTests
//
//  Created by Jordy Xavier Pazaran Reyes on 9/4/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import Foundation
@testable import IMGUR

class MockItemsListRouter: ItemsRoutingLogic, ItemDataPassing {
    
    var dataStore: ItemDataStore?
    var routeToSearchPopUpCalled = false
    var routeToDetailCalled = false
    var dismissPresentCalled = false
    
    func routeToSearchPopUp() {
        routeToSearchPopUpCalled = true
    }
    
    func routeToDetail(indexPath: Int) {
        routeToDetailCalled = true
    }
    
    func dismissPresent() {
        dismissPresentCalled = true
    }
}

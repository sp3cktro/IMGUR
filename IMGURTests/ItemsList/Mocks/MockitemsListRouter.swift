//
//  MockitemListRouter.swift
//  IMGURTests
//
//  Created by Jordy Xavier Pazaran Reyes on 9/4/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import Foundation
@testable import IMGUR

class MockItemsListRouter: ItemDataPassing, ItemsRoutingLogic {
 
    var dataStore: ItemDataStore?
    var routeToSearchPopUpCalled = false
    var routeToDetailCalled = false
    var dismissPresentCalled = false
    
    func routeToSearchPopUp() {
        routeToSearchPopUpCalled = true
    }
    
    func routeToDetail(image: String) {
        routeToDetailCalled = true
    }
    
    func dismissPresent() {
        dismissPresentCalled = true
    }
}

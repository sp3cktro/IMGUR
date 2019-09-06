//
//  MockItemListTableViewController.swift
//  IMGURTests
//
//  Created by Jordy Xavier Pazaran Reyes on 9/4/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import Foundation
@testable import IMGUR

class MockItemsListTableViewController: ItemDisplayLogic {
    
    var displayItemsCalled = false
    var displayTellDetailCalled = false
    
    func displayItems(itemsFetched: ItemsLogicModel.Response.Pixabay) {
        displayItemsCalled = true
    }
    
    func displayTellDetail() {
        displayTellDetailCalled = true
    }
}

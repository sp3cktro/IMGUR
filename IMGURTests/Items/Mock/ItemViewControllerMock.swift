//
//  ItemViewControllerMock.swift
//  IMGURTests
//
//  Created by Jordy Xavier Pazaran Reyes on 9/9/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import Foundation
@testable import IMGUR

class ItemViewControllerMock: ItemsViewInterface {
    var showItemsCalled = false
    var showDismissVCCalled = false
    
    func showItems(response: Pixabay) {
        showItemsCalled = true
    }
    
    func dismissVC() {
        showDismissVCCalled = true
    }
}

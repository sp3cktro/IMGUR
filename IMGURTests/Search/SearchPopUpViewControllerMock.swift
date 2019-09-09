//
//  SearchPopUpViewControllerMock.swift
//  IMGURTests
//
//  Created by Jordy Xavier Pazaran Reyes on 9/9/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import Foundation
@testable import IMGUR

class SerachpopUpViewControllerMock: SearchPopUpViewControllerInterface {
    var passKeywordToItemsListCalled = false
    
    func passKeywordToItemsList(keyword: String) {
        passKeywordToItemsListCalled = true
    }
}

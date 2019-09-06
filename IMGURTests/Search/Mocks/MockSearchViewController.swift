//
//  MockSearchViewController.swift
//  IMGURTests
//
//  Created by Jordy Xavier Pazaran Reyes on 9/5/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import Foundation
@testable import IMGUR

class MockSearchViewController: SearchDisplayLogcic {
    
    var displayKeyword = false
    
    func displayKeyword(model: SearchLogicModel.ViewModel) {
        displayKeyword = true
    }
}

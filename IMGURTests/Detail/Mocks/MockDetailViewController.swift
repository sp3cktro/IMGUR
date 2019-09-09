//
//  MockDetailViewController.swift
//  IMGURTests
//
//  Created by Jordy Xavier Pazaran Reyes on 9/5/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import Foundation
@testable import IMGUR

class MockDetailViewController: DetailDisplayLogic {
    var displayImageCalled = false
    
    func displayImage(imageUrl: DetailLogicModel.Response) {
        displayImageCalled = true
    }
}

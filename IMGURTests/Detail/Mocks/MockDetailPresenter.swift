//
//  MockDetailPresenter.swift
//  IMGURTests
//
//  Created by Jordy Xavier Pazaran Reyes on 9/5/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import Foundation
@testable import IMGUR

class MockDetailPresenter: DetailPresentationLogic {
    var presentImageCalled = false
    
    func presentImage(response: DetailLogicModel.Response) {
        presentImageCalled = true
    }
}

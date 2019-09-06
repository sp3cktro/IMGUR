//
//  MockDetailInteractor.swift
//  IMGURTests
//
//  Created by Jordy Xavier Pazaran Reyes on 9/5/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import Foundation
@testable import IMGUR

class MockDetailInteractor: DetailBusinesslogic, DetailDataStore {
    var urlImage: String = ""
    var showImageCalled = false
    
    func showImage(request: DetailLogicModel.Request) {
        showImageCalled = true
    }
}

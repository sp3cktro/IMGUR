//
//  ItemsPresenterMock.swift
//  IMGURTests
//
//  Created by Jordy Xavier Pazaran Reyes on 9/9/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import Foundation
@testable import IMGUR

class ItemPresenterMock: DetailPresenterInterface {
    var getImageCalled = false
    
    func getImages(image: String) {
        getImageCalled = true
    }
}

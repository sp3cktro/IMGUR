//
//  MockItemsWorker.swift
//  IMGURTests
//
//  Created by Jordy Xavier Pazaran Reyes on 9/6/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import Foundation
@testable import IMGUR

class MockItemsWorker: ItemsWorker {
    var getImagesCalled = false
    
    override func getImages(for keyword: String, completionHandler: @escaping (Result<ItemsLogicModel.Response.Pixabay, Error>) -> ()) {
        
        getImagesCalled = true
        
    }
}

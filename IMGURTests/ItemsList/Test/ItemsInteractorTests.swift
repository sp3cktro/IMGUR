//
//  ItemsInteractorTests.swift
//  IMGURTests
//
//  Created by Jordy Xavier Pazaran Reyes on 9/6/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import XCTest
@testable import IMGUR

class ItemsInteractorTests: XCTestCase {
    var sut: ItemsWorker?
    var mockPresenter: MockItemsListPresenter?
    var workerSpy: MockItemsWorker?
    
    override func setUp() {
        mockPresenter = MockItemsListPresenter()
        sut = ItemsWorker()
        workerSpy = MockItemsWorker()
    }

    override func tearDown() {
        

    }

    func testExample() {
         
    }
}

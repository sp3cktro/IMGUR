//
//  SearchPresenterTests.swift
//  IMGURTests
//
//  Created by Jordy Xavier Pazaran Reyes on 9/5/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import XCTest
@testable import IMGUR

class SearchPresenterTests: XCTestCase {
    var sut: SearchPresenter?
   
    func testGetItemsCalled() {
        // Given
        let viewControllerMock = MockSearchViewController()
        let sut = SearchPresenter(viewController: viewControllerMock)
        let dummyResponse = SearchLogicModel.Response()
        // When
        sut.presentTellItemsTable(response: dummyResponse)
        // Then
        XCTAssertTrue(viewControllerMock.displayKeyword)
    }
    
    func testDisplayItemsCalled() {
        // Given
        let viewControllerMock = MockSearchViewController()
        let dummyResponse = SearchLogicModel.Response()
        // When
        sut?.presentTellItemsTable(response: dummyResponse)
        // Then
        XCTAssertFalse(viewControllerMock.displayKeyword)
    }
}

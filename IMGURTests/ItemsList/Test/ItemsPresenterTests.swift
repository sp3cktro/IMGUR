//
//  ItemsPresenterTests.swift
//  IMGURTests
//
//  Created by Jordy Xavier Pazaran Reyes on 9/4/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import XCTest
@testable import IMGUR

class ItemsPresenterTests: XCTestCase {
    var sut: ItemsPresenter?
    
    func testDisplayItemsCalled() {
        // Given
        let viewControllerMock = MockItemsListTableViewController()
        let sut = ItemsPresenter(viewController: viewControllerMock)
        let reponseMock = ItemsLogicModel.Response.Pixabay(totalHits: 1, hits: [ItemsLogicModel.Response.Hit(largeImageURL: "T##String", tags: "T##String", user: "T##String", userImageURL: "VCXV", previewURL: "T##String")])
        // When
        sut.presentItems(response: reponseMock)
        // Then
        XCTAssertTrue(viewControllerMock.displayItemsCalled)
    }
    
    func testDisplayItemsNotCalled() {
        // Given
        let viewControllerMock = MockItemsListTableViewController()
        let reponseMock = ItemsLogicModel.Response.Pixabay(totalHits: 1, hits: [ItemsLogicModel.Response.Hit(largeImageURL: "T##String", tags: "T##String", user: "T##String", userImageURL: "VCXV", previewURL: "T##String")])
        // When
        sut?.presentItems(response: reponseMock)
        // Then
        XCTAssertFalse(viewControllerMock.displayItemsCalled)
    }
}

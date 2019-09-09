//
//  ItemsPresenterTests.swift
//  IMGURTests
//
//  Created by Jordy Xavier Pazaran Reyes on 9/4/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import XCTest
@testable import IMGUR

class ItemsTableViewControllerTests: XCTestCase {
    
    var sut: ItemsTableViewController?
    var mockInteractor: MockItemsListInteractor?
    var mockRouter: MockItemsListRouter?
    
    override func setUp() {
        //Given
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let sut = storyboard.instantiateViewController(withIdentifier: "ItemsTableViewController") as? ItemsTableViewController else { return }
        mockInteractor = MockItemsListInteractor()
        mockRouter = MockItemsListRouter()
        self.sut = sut
    }
    
    override func tearDown() {
        sut = nil
        mockInteractor = nil
        mockRouter = nil
        super.tearDown()
    }
    
    func testShowItemsCalled() {
        //Given
        guard let interactor = mockInteractor else {
            return XCTFail()
        }
        guard let router = mockRouter else {
            return XCTFail()
        }
        sut?.setupViewController(interactor: interactor, router: router)
        // When
        sut?.showItems()
        // Then
        XCTAssertTrue(interactor.showItemsCalled)
    }
    
    func testShowItemsNotCalled() {
        //When
        sut?.showItems()
        //Then
        XCTAssertFalse(mockInteractor?.showItemsCalled ?? false)
    }
    
    func testTableViewExists() {
        // when
        sut?.loadViewIfNeeded()
        // then
        XCTAssertNotNil(sut?.tableView)
    }
    
    
    func testTableViewCellLabelsShowsCorrectInformation() {
        // given
        let dummyHit = ItemsLogicModel.Response.Hit(largeImageURL: "fakeURL", tags: "tag", user: "user", userImageURL: "url", previewURL: "previewURL")
        let dummyPixabay = ItemsLogicModel.Response.Pixabay(totalHits: 1, hits: [dummyHit])
        let dummyIndexPath = IndexPath(row: 0, section: 0)
        // when
        sut?.loadViewIfNeeded()
        sut?.items = dummyPixabay
        guard let sectionTableView = sut?.tableView else {
            XCTFail()
            return
        }
        guard let cell = sut?.tableView(sectionTableView, cellForRowAt: dummyIndexPath) as? ItemCell else {
            XCTFail()
            return
        }
        // then
        XCTAssertEqual(cell.itemTitle?.text, dummyHit.tags)
        XCTAssertEqual(cell.userName?.text, dummyHit.user)
    }
}

//
//  ItemsViewControllerTests.swift
//  IMGURTests
//
//  Created by Jordy Xavier Pazaran Reyes on 9/9/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import XCTest
@testable import IMGUR

class ItemsTableViewControllerTests: XCTestCase {
    
    var sut: ItemsTableViewController?
    var mockPresenter: ItemPresenterMock?

    
    override func setUp() {
        //Given
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let sut = storyboard.instantiateViewController(withIdentifier: "ItemsTableViewController") as? ItemsTableViewController else { return }
        self.sut = sut
        mockPresenter = ItemPresenterMock()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
        mockPresenter = nil
    }

    func testShowItemsGetResponse(){
        let dummyHit = Hit(largeImageURL: "fakeURL", tags: "tag", user: "user", userImageURL: "url", previewURL: "previewURL")
        let dummyResponse = Pixabay(totalHits: 1, hits: [dummyHit])
        //when
        sut?.showItems(response: dummyResponse)
        //then
        XCTAssertNotNil(sut?.pixabayModel)
    }
    
    func testTableViewExists() {
        // when
        sut?.loadViewIfNeeded()
        // then
        XCTAssertNotNil(sut?.tableView)
    }
    
    func testCustomItemCellCanInstance() {
        // given
        let dummyIndexPath = IndexPath(item: 0, section: 0)
        // when
        sut?.loadViewIfNeeded()
        let itemCell = UINib(nibName: "ItemCell", bundle: nil)
        sut?.tableView.register(itemCell, forCellReuseIdentifier: "ItemCell")
        guard let sectionTableView = sut?.tableView else {
            XCTFail()
            return
        }
        // then
        XCTAssertNotNil(sut?.tableView(sectionTableView, cellForRowAt: dummyIndexPath) as? ItemCell)
    }
    
    func testTableViewCellLabelsShowsCorrectInformation() {
        // given
        let dummyHit = Hit(largeImageURL: "fakeURL", tags: "tag", user: "user", userImageURL: "url", previewURL: "previewURL")
        let dummyPixabay = Pixabay(totalHits: 1, hits: [dummyHit])
        let dummyIndexPath = IndexPath(row: 0, section: 0)
        // when
        sut?.loadViewIfNeeded()
        sut?.pixabayModel = dummyPixabay
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

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
    var worker: ItemsWorker?
    
    override func setUp() {
        mockPresenter = MockItemsListPresenter()
        sut = ItemsWorker()
        worker = ItemsWorker()
    }
    
    //  Integration test, this test is not following FIRST principles
    override func tearDown() {
        mockPresenter = nil
        sut = nil
        worker = nil
    }

    func testExample() {
        let dummyKeyword = "cats"
        let dummyHit = ItemsLogicModel.Response.Hit(largeImageURL: "fakeURL", tags: "tag", user: "user", userImageURL: "url", previewURL: "previewURL")
        let dummyResponse = ItemsLogicModel.Response.Pixabay(totalHits: 1, hits: [dummyHit])
        worker?.getImages(for: dummyKeyword, completionHandler: { [weak self] result in
            switch result {
            case .success:
                self!.mockPresenter?.presentTellDetail(reponse: dummyResponse)
                break
            case .failure:
                break
            }
        })
        XCTAssertTrue(mockPresenter!.presentTellDetailCalled)
    }
}

//
//  SearchInteractorTests.swift
//  IMGURTests
//
//  Created by Jordy Xavier Pazaran Reyes on 9/5/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import XCTest
@testable import IMGUR

class SearchInteractorTests: XCTestCase {
    var sut: SearchInteractor?
    var searchPresenterMock: MockSearchPresenter?
    
    override func setUp() {
        searchPresenterMock = MockSearchPresenter()
        let sut = SearchInteractor(presenter: searchPresenterMock!)
        self.sut = sut
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func testPresenTellItemsCalled() {
        //Given
        let dummyKeyword = "gatos"
        let dummyRequest = SearchLogicModel.Request(keyword: dummyKeyword)
        //When
        sut?.getKeyword(request: dummyRequest)
        //Then
        XCTAssertTrue(searchPresenterMock!.presentTellItemCalled)
    }
}



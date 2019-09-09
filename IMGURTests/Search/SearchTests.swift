//
//  SearchTests.swift
//  IMGURTests
//
//  Created by Jordy Xavier Pazaran Reyes on 9/9/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import XCTest
@testable import IMGUR

class SearchTests: XCTestCase {
    var itemPresenterMock: ItemPresenterMock!
    var sut: SearchPopUpViewController!
    
    override func setUp() {
        // given
        let sut = SearchPopUpViewController.init(nibName: "SearchPopUpViewController", bundle: nil)
        itemPresenterMock = ItemPresenterMock()
        self.sut = sut
    }
    
    override func tearDown() {
        sut = nil
        itemPresenterMock = nil
    }

    func testSearchViewExists() {
        // when
        sut.loadViewIfNeeded()
        // then
        XCTAssertNotNil(sut?.searchView)
    }
    
    func testKeywordTextFieldExists() {
        // when
        sut.loadViewIfNeeded()
        // then
        XCTAssertNotNil(sut?.keywordTextField)
    }
    
    func testSearchButtonExists() {
        // when
        sut.loadViewIfNeeded()
        // then
        XCTAssertNotNil(sut?.searchButton)
    }
    
    func testCancelButtonExists() {
        // when
        sut.loadViewIfNeeded()
        // then
        XCTAssertNotNil(sut?.cancelButton)
    }
    
    func testBlurEffectIsSubviewed() {
        // when
        sut.loadViewIfNeeded()
        // then
        guard let blur = sut?.view.subviews[0] else {
            XCTFail()
            return
        }
        XCTAssertNotNil(blur as? UIVisualEffectView)
    }
}

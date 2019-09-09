//
//  SearchViewControllerTests.swift
//  IMGURTests
//
//  Created by Jordy Xavier Pazaran Reyes on 9/5/19.
//  Copyright © 2019 specktro. All rights reserved.
//
import XCTest
@testable import IMGUR

class SearchViewControllerTests: XCTestCase {
    
    var sut: SearchPopUpViewController?
    var searchInteractorMock: MockSearchIntercator?
    var searchRouterMock: MockSearchRouter?
    
    override func setUp() {
        //Given
         let sut = SearchPopUpViewController.init(nibName: "SearchPopUpViewController", bundle: nil)
        searchInteractorMock = MockSearchIntercator()
        searchRouterMock = MockSearchRouter()
        self.sut = sut
    }
    
    override func tearDown() {
        sut = nil
        searchRouterMock = nil
        searchInteractorMock = nil
    }
    
    func testGetKeywordCalled() {
        //Given
        let dummyKeyword = "gatos"
        sut?.setupViewController(interactor: searchInteractorMock!, router: searchRouterMock!)
        //When
        sut?.showKeyword(keywordNeedIt: dummyKeyword)
        //Then
        XCTAssertTrue(searchInteractorMock?.getKeywordCalled ?? false)
    }
    
    func testGetKeywordNotCalled() {
        //Given
        let dummyKeyword = "  "
        sut?.setupViewController(interactor: searchInteractorMock!, router: searchRouterMock!)
        //When
        sut?.showKeyword(keywordNeedIt: dummyKeyword)
        //Then
        XCTAssertFalse(searchInteractorMock?.getKeywordCalled ?? true)
    }
    
    func testRouteToItemsListSearchButtonCalled() {
        //Given
        let dummyViewModel = SearchLogicModel.ViewModel()
        sut?.setupViewController(interactor: searchInteractorMock!, router: searchRouterMock!)
        //When
        sut?.displayKeyword(model: dummyViewModel)
        //Then
        XCTAssertFalse(searchInteractorMock?.getKeywordCalled ?? true)
    }
    
    func testSearchViewExists() {
        // when
        sut!.loadViewIfNeeded()
        // then
        XCTAssertNotNil(sut?.searchView)
    }
    
    func testKeywordTextFieldExists() {
        // when
        sut!.loadViewIfNeeded()
        // then
        XCTAssertNotNil(sut?.keywordTextField)
    }
    
    func testSearchButtonExists() {
        // when
        sut!.loadViewIfNeeded()
        // then
        XCTAssertNotNil(sut?.searchButton)
    }
    
    func testCancelButtonExists() {
        // when
        sut!.loadViewIfNeeded()
        // then
        XCTAssertNotNil(sut?.cancelButton)
    }
    
    func testBlurEffectIsSubviewed() {
        // when
        sut!.loadViewIfNeeded()
        // then
        guard let blur = sut?.view.subviews[0] else {
            XCTFail()
            return
        }
        XCTAssertNotNil(blur as? UIVisualEffectView)
    }
}

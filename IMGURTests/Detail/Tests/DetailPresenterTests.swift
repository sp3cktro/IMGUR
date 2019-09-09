//
//  DetailPresenterTests.swift
//  IMGURTests
//
//  Created by Jordy Xavier Pazaran Reyes on 9/5/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import XCTest
@testable import IMGUR

class DetailPresenterTests: XCTestCase {
    var sut: DetailPresenter?
    var detailViewControllerMock: MockDetailViewController?
    
    func testDisplayImageCalled() {
        //Given
        detailViewControllerMock = MockDetailViewController()
        let sut = DetailPresenter(viewController: detailViewControllerMock!)
        let dummyUrlImage = "dummy.com"
        let dummyResponse = DetailLogicModel.Response(largeImageURL: dummyUrlImage)
        //When
        sut.presentImage(response: dummyResponse)
        //Then
        XCTAssertTrue(detailViewControllerMock?.displayImageCalled ?? false)
    }
}

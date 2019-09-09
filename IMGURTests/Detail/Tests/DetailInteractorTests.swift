//
//  DetailInteractorTests.swift
//  IMGURTests
//
//  Created by Jordy Xavier Pazaran Reyes on 9/5/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import XCTest
@testable import IMGUR

class DetailInteractorTests: XCTestCase {
    var sut: DetailInteractor?
    var detailPresenterMock: MockDetailPresenter?

    func testPresentImageCalled() {
        //Given
        detailPresenterMock = MockDetailPresenter()
        let sut = DetailInteractor(presenter: detailPresenterMock!)
        let dummyRequest = DetailLogicModel.Request()
        //When
        sut.showImage(request: dummyRequest)
        //Then
        XCTAssertTrue(detailPresenterMock?.presentImageCalled ?? false)
    }

}

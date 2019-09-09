//
//  DetailPrsenterTests.swift
//  IMGURTests
//
//  Created by Jordy Xavier Pazaran Reyes on 9/9/19.
//  Copyright © 2019 specktro. All rights reserved.
//
import XCTest
@testable import IMGUR

class DetailPresenterTests: XCTestCase {
    
    func testGetImageUrl() {
        let mockView = DetailViewControllerMock()
        let sut = DetailPresenter(view: mockView)
        let image = "cats.com"
        sut.getImages(image: image)
        XCTAssertEqual(image, mockView.imageUrl)
    }
}

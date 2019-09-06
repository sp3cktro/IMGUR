//
//  DetailViewControllerTests.swift
//  IMGURTests
//
//  Created by Jordy Xavier Pazaran Reyes on 9/5/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import XCTest
@testable import IMGUR

class DetailViewControllerTests: XCTestCase {

    var sut: DetailViewController?
    var mockInteractor: MockDetailInteractor?
    var mockRouter: MockDetailRouter?
    
    override func setUp() {
        //Given
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let sut = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        mockInteractor = MockDetailInteractor()
        mockRouter = MockDetailRouter()
        self.sut = sut
    }

    override func tearDown() {
        mockInteractor = nil
        sut = nil
    }
    
    func testShowImageCalled() {
        //Given
        sut?.setupViewController(interactor: mockInteractor!, router: mockRouter!)
        let dummyResponse = DetailLogicModel.Request()
        //When
        sut?.showImage(request: dummyResponse)
        //Then
        XCTAssertTrue(mockInteractor?.showImageCalled ?? false)
    }
    
    func testShowImageNotCalled() {
        //Given
        let dummyResponse = DetailLogicModel.Request()
        //When
        sut?.showImage(request: dummyResponse)
        //Then
        XCTAssertFalse(mockInteractor?.showImageCalled ?? true)
    }
    
    func testDetailImageViewExists() {
        //when
        sut?.setupViewController(interactor: mockInteractor!, router: mockRouter!)
        sut!.loadViewIfNeeded()
        //then
        XCTAssertNotNil(sut!.imageView)
    }
}

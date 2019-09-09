//
//  DetailViewControllerTests.swift
//  IMGURTests
//
//  Created by Jordy Xavier Pazaran Reyes on 9/9/19.
//  Copyright © 2019 specktro. All rights reserved.
//
import XCTest
@testable import IMGUR

class DetailViewControllerTests: XCTestCase {
    
    var sut: DetailViewController?
    var mockPresenter: DetailPresenterMock?
    
    override func setUp() {
        //Given
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let sut = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        mockPresenter = DetailPresenterMock()
        self.sut = sut
    }
    
    override func tearDown() {
        sut = nil
        mockPresenter = nil
    }
    
    func testDetailImageViewExists() {
        //when
        sut?.setupView(presenter: mockPresenter!)
        sut!.loadViewIfNeeded()
        //then
        XCTAssertNotNil(sut!.imageDetail)
    }
}

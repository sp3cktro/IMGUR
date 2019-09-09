import XCTest

class DetailUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        continueAfterFailure = false
        app.launchArguments = ["enable-testing"]
        app.launch()
        app.tables.cells.firstMatch.tap()
    }
    
    func testDetailImageViewExists() {
        XCTAssertTrue(app.images[DetailAccessibilityIdentifiers.ImageViews.detailImageView.rawValue].exists)
    }
}

struct DetailAccessibilityIdentifiers {
    enum ImageViews: String {
        case detailImageView = "detail_image_view"
    }
}

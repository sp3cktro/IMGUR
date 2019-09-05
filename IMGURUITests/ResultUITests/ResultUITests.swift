import XCTest

class ResultUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        continueAfterFailure = false
        app.launchArguments = ["enable-testing"]
        app.launch()
    }
    
    func testPhotoImageViewExists() {
        let imageView = app.images[ResultAccessibilityIdentifiers.ImageViews.photo.rawValue]
        XCTAssertTrue(imageView.exists)
    }
    
    func testItemCellsExists() {
        XCTAssertTrue(app.tables.cells.firstMatch.exists)
    }
    
    func testLabelsExists() {
        XCTAssertTrue(app.staticTexts[ResultAccessibilityIdentifiers.Labels.user.rawValue].exists)
        XCTAssertTrue(app.staticTexts[ResultAccessibilityIdentifiers.Labels.tags.rawValue].exists)
    }
    
    func testSearchButtonExists() {
        XCTAssertTrue(app.buttons[ResultAccessibilityIdentifiers.Buttons.searchButton.rawValue].exists)
    }
}

//MARK: - AccessibilityIdentifiers
struct ResultAccessibilityIdentifiers {
    enum Cells: String {
        case itemCell = "item_cell"
    }
    
    enum Labels: String {
        case user = "user_id"
        case tags = "tags_id"
    }
    
    enum ImageViews: String {
        case photo = "photo_id"
    }
    
    enum Buttons: String {
        case searchButton = "search_button_id"
    }
}

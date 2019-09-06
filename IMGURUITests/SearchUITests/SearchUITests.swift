import XCTest

class SearchUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        continueAfterFailure = false
        app.launchArguments = ["enable-testing"]
        app.launch()
        app.buttons[ResultAccessibilityIdentifiers.Buttons.searchButton.rawValue].tap()
    }
    
    func testKeywordTextFieldExists() {
        XCTAssertTrue(app.textFields[SearchAccessibilityIdentifiers.TextFields.keywordTextField.rawValue].waitForExistence(timeout: 5))
    }
    
    func testLabelsExists() {
        XCTAssertTrue(app.staticTexts[SearchAccessibilityIdentifiers.Labels.titleLabel.rawValue].exists)
    }
    
    
    
    func testSearchButtonExists() {
        XCTAssertTrue(app.buttons[SearchAccessibilityIdentifiers.Buttons.searchButton.rawValue].exists)
    }
    
    func testCancelButtonExists() {
        XCTAssertTrue(app.buttons[SearchAccessibilityIdentifiers.Buttons.cancelButton.rawValue].exists)
    }
    
    func testCancelButtonDissmissController() {
        app.buttons[SearchAccessibilityIdentifiers.Buttons.cancelButton.rawValue].tap()
        XCTAssertFalse(app.staticTexts[SearchAccessibilityIdentifiers.Labels.titleLabel.rawValue].exists)
    }
}

//MARK: - Accessibility Identifiers
struct SearchAccessibilityIdentifiers {
    enum Labels: String {
        case titleLabel = "search_title_label"
    }
    
    enum TextFields: String {
        case keywordTextField = "search_keyword_text_field"
    }
    
    enum Buttons: String {
        case searchButton = "search_search_button"
        case cancelButton = "search_cancel_button"
    }
}

import XCTest
@testable import MacOSInteractor

final class MacOSInteractorTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(MacOSInteractor().text, "Hello, World!")
    }


    static var allTests = [
        ("testExample", testExample),
    ]
}

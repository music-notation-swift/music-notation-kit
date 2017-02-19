import XCTest
@testable import MusicNotationKit

class MusicNotationKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(MusicNotationKit().text, "Hello, World!")
    }


    static var allTests : [(String, (MusicNotationKitTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}

import Foundation
import XCTest
import SwiftProtobuf

@testable import MusicNotationKit

class _KeyTests: XCTestCase {
    func testJsonDecode() {
        let json = "{\"type\":\"MAJOR\", \"noteLetter\":\"A\", \"accidental\":\"UNDEF_ACCIDENTAL\"}"
        assertNoErrorThrown {
            let key = try _Key(json: json)
            XCTAssertEqual(key.noteLetter, _NoteLetter.a)
        }
    }


    static var allTests : [(String, (_KeyTests) -> () throws -> Void)] {
        return [
            ("testJsonDecode", testJsonDecode),
        ]
    }
}

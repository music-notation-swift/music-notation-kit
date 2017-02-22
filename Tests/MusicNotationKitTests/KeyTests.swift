import Foundation
import XCTest
import SwiftProtobuf

@testable import MusicNotationKit

class MusicNotationKeyTests: XCTestCase {
    func testJsonDecode() {
        let json = "{\"type\":\"MAJOR\", \"noteLetter\":\"A\", \"accidental\":\"UNDEF_ACCIDENTAL\"}"
        assertNoErrorThrown {
            let key = try MusicNotation_Key(json: json)
            XCTAssertEqual(key.noteLetter, MusicNotation_NoteLetter.a)
        }
    }


    static var allTests : [(String, (MusicNotationKeyTests) -> () throws -> Void)] {
        return [
            ("testJsonDecode", testJsonDecode),
        ]
    }
}

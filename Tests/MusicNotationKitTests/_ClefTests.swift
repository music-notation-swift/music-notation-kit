import Foundation
import XCTest
import SwiftProtobuf

import MusicNotationCore
@testable import MusicNotationKit

class _ClefTests: XCTestCase {
    let json = "{\"tone\":{\"noteLetter\":\"A\",\"accidental\":\"NATURAL\"},\"location\":{\"type\":\"LINE\",\"number\":\"2\"}}"
    func testJsonDecode() {
        assertNoErrorThrown {
            let tsProto = try _Clef(json: json)
            let ts = tsProto.transform()
            XCTAssertEqual(ts.tone?.noteLetter, .a)
            XCTAssertEqual(ts.transform(), tsProto)
        }
    }

    func testJsonEncode() {
        // TODO: Add test code.
    }
    static var allTests : [(String, (_ClefTests) -> () throws -> Void)] {
        return [
            ("testJsonDecode", testJsonDecode),
            ("testJsonEncode", testJsonEncode),
        ]
    }
}

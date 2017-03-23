import Foundation
import XCTest
import SwiftProtobuf

import MusicNotationCore
@testable import MusicNotationKit

class _NoteDurationTests: XCTestCase {
    let json = "{\"value\":\"WHOLE\",\"dotCount\":\"1\"}"
    func testJsonDecode() {
        assertNoErrorThrown {
            let noteDurationProto = try _NoteDuration(json: json)
            let noteDuration = try noteDurationProto.transform()
            XCTAssertEqual(noteDuration.value, .whole)
            XCTAssertEqual(noteDuration.dotCount, 1)
            XCTAssertEqual(noteDuration.transform(), noteDurationProto)
        }
    }

    func testJsonEncode() {
        assertNoErrorThrown {
            let noteDuration = try NoteDuration(value: .whole, dotCount: 1)
            let noteDurationProto =  noteDuration.transform()
            XCTAssertEqual(noteDurationProto.value, .whole)
            XCTAssertEqual(noteDurationProto.dotCount, 1)
            let noteDurationJson = try noteDurationProto.serializeJSON()
            XCTAssertEqual(noteDurationJson, json)
        }
    }
    static var allTests : [(String, (_NoteDurationTests) -> () throws -> Void)] {
        return [
            ("testJsonDecode", testJsonDecode),
            ("testJsonEncode", testJsonEncode),
        ]
    }
}

import Foundation
import XCTest
import SwiftProtobuf

import MusicNotationCore
@testable import MusicNotationKit

class _IntervalTests: XCTestCase {
    let json = "{\"quality\":\"MAJOR\",\"number\":\"3\"}"
    func testJsonDecode() {
        assertNoErrorThrown {
            let intervalProto = try _Interval(json: json)
            let interval = try intervalProto.transform()
            XCTAssertEqual(interval.quality, .major)
            XCTAssertEqual(interval.number, 3)
            XCTAssertEqual(interval.transform(), intervalProto)
        }
    }

    func testJsonEncode() {
        assertNoErrorThrown {
            let interval = try Interval(quality: .major, number: 3)
            let intervalProto =  interval.transform()
            XCTAssertEqual(intervalProto.quality, .major)
            XCTAssertEqual(intervalProto.number, 3)
            let intervalJson = try intervalProto.serializeJSON()
            XCTAssertEqual(intervalJson, json)
        }
    }
    static var allTests : [(String, (_IntervalTests) -> () throws -> Void)] {
        return [
            ("testJsonDecode", testJsonDecode),
            ("testJsonEncode", testJsonEncode),
        ]
    }
}

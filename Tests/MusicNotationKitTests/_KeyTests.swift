import Foundation
import XCTest
import SwiftProtobuf

import MusicNotationCore
@testable import MusicNotationKit

class _KeyTests: XCTestCase {
    let json = "{\"type\":\"MAJOR\",\"noteLetter\":\"A\",\"accidental\":\"SHARP\"}"
    func testJsonDecode() {
        assertNoErrorThrown {
            let keyProto = try _Key(json: json)
            let key = keyProto.transform()
            XCTAssertEqual(key.type, .major)
            XCTAssertEqual(key.noteLetter, .a)
            XCTAssertEqual(key.accidental, .sharp)
            XCTAssertEqual(key.transform(), keyProto)
        }
    }

    func testJsonEncode() {
        let key = Key(noteLetter: .a, accidental: .sharp, type: .major)
        assertNoErrorThrown {
            let keyProto =  key.transform()
            XCTAssertEqual(keyProto.type, .major)
            XCTAssertEqual(keyProto.noteLetter, .a)
            XCTAssertEqual(keyProto.accidental, .sharp)
            let keyJson = try keyProto.serializeJSON()
            XCTAssertEqual(keyJson, json)
        }
    }
    static var allTests : [(String, (_KeyTests) -> () throws -> Void)] {
        return [
            ("testJsonDecode", testJsonDecode),
            ("testJsonEncode", testJsonEncode),
        ]
    }
}

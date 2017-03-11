import Foundation
import XCTest
import SwiftProtobuf

import MusicNotationCore
@testable import MusicNotationKit

class _TimeSignatureTests: XCTestCase {
    func testJsonDecode() {
        let json = "{\"topNumber\":\"3\", \"bottomNumber\":\"4\", \"tempo\":\"120\"}"
        assertNoErrorThrown {
            let tsProto = try _TimeSignature(json: json)
            let ts = tsProto.transform()
            XCTAssertEqual(ts.topNumber, 3)
            XCTAssertEqual(ts.bottomNumber, 4)
            XCTAssertEqual(ts.tempo, 120)
            XCTAssertEqual(ts.transform(), tsProto)
        }
    }

    func testJsonEncode() {
        let ts = TimeSignature(topNumber: 3, bottomNumber: 4, tempo: 120)
        assertNoErrorThrown {
            let tsProto =  ts.transform()
            XCTAssertEqual(tsProto.topNumber, 3)
            XCTAssertEqual(tsProto.bottomNumber, 4)
            XCTAssertEqual(tsProto.tempo, 120)
            XCTAssertEqual(tsProto.transform(), ts)
            let json = try tsProto.serializeJSON()
            XCTAssertEqual(json, "{\"topNumber\":\"3\",\"bottomNumber\":\"4\",\"tempo\":\"120\"}")
        }
    }
    static var allTests : [(String, (_TimeSignatureTests) -> () throws -> Void)] {
        return [
            ("testJsonDecode", testJsonDecode),
            ("testJsonEncode", testJsonEncode),
        ]
    }
}

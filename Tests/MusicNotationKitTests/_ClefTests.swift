import Foundation
import XCTest
import SwiftProtobuf

import MusicNotationCore
@testable import MusicNotationKit

class _ClefTests: XCTestCase {
    let json = "{\"tone\":{\"noteLetter\":\"G\",\"accidental\":\"NATURAL\",\"octave\":\"OCT4\"},\"location\":{\"number\":1}}"
    func testJsonDecode() {
        assertNoErrorThrown {
            let clefProto = try _Clef(json: json)
            let clef = clefProto.transform()
            XCTAssertEqual(clef.tone?.noteLetter, .g)
            XCTAssertEqual(clef.staffLocation.locationType, .line)
            XCTAssertEqual(clef.staffLocation.number, 1)
            XCTAssertEqual(clef.transform(), clefProto)
        }
    }

    func testJsonEncode() {
        let clef = Clef.treble
        assertNoErrorThrown {
            let clefProto =  clef.transform()
            XCTAssertEqual(clefProto.tone.noteLetter, .g)
            let clefJson = try clefProto.serializeJSON()
            XCTAssertEqual(clefJson, json)
        }
    }
    static var allTests : [(String, (_ClefTests) -> () throws -> Void)] {
        return [
            ("testJsonDecode", testJsonDecode),
            ("testJsonEncode", testJsonEncode),
        ]
    }
}

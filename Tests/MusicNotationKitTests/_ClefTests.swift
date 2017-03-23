import Foundation
import XCTest
import SwiftProtobuf

import MusicNotationCore
@testable import MusicNotationKit

class _ClefTests: XCTestCase {
    let json = "{\"tone\":{\"noteLetter\":\"G\",\"accidental\":\"NATURAL\",\"octave\":\"OCT4\"},\"location\":{\"number\":1}}"
    func testJsonDecode() {
        assertNoErrorThrown {
            let cleffProto = try _Clef(json: json)
            let cleff = cleffProto.transform()
            XCTAssertEqual(cleff.tone?.noteLetter, .g)
            XCTAssertEqual(cleff.staffLocation.locationType, .line)
            XCTAssertEqual(cleff.staffLocation.number, 1)
            XCTAssertEqual(cleff.transform(), cleffProto)
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

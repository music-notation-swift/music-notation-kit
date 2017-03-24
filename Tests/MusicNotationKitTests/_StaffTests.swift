import Foundation
import XCTest
import SwiftProtobuf

import MusicNotationCore
@testable import MusicNotationKit

class _StaffTests: XCTestCase {
    let json = "{\"clef\":{\"tone\":{\"noteLetter\":\"G\",\"accidental\":\"NATURAL\",\"octave\":\"OCT4\"},\"location\":{\"number\":1}},\"instrument\":\"GUITAR6\"}"
    func testJsonDecode() {
        assertNoErrorThrown {
            let staffProto = try _Staff(json: json)
            let staff = try staffProto.transform()
            XCTAssertEqual(staff.clef.tone?.noteLetter, .g)
            XCTAssertEqual(staff.clef.staffLocation.locationType, .line)
            XCTAssertEqual(staff.clef.staffLocation.number, 1)
            XCTAssertEqual(staff.transform(), staffProto)
        }
    }

    func testJsonEncode() {
        let staff = Staff(clef:Clef.treble, instrument: .guitar6)
        assertNoErrorThrown {
            let staffProto =  staff.transform()
            XCTAssertEqual(staffProto.clef.tone.noteLetter, .g)
            let staffJson = try staffProto.serializeJSON()
            XCTAssertEqual(staffJson, json)
        }
    }
    static var allTests : [(String, (_StaffTests) -> () throws -> Void)] {
        return [
            ("testJsonDecode", testJsonDecode),
            ("testJsonEncode", testJsonEncode),
        ]
    }
}

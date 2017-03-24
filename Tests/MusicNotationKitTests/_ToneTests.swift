import Foundation
import XCTest
import SwiftProtobuf

import MusicNotationCore
@testable import MusicNotationKit

class _ToneTests: XCTestCase {
    let json = "{\"noteLetter\":\"G\",\"accidental\":\"NATURAL\",\"octave\":\"OCT4\"}"
    func testJsonDecode() {
        assertNoErrorThrown {
            let toneProto = try _Tone(json: json)
            let tone = toneProto.transform()
            XCTAssertEqual(tone.noteLetter, .g)
            XCTAssertEqual(tone.accidental, .natural)
            XCTAssertEqual(tone.octave, .octave4)

            XCTAssertEqual(tone.transform(), toneProto)
        }
    }

    func testJsonEncode() {
        let tone = Tone(noteLetter: .g, accidental: .natural, octave: .octave4)
        assertNoErrorThrown {
            let toneProto =  tone.transform()
            XCTAssertEqual(toneProto.noteLetter, .g)
            let toneJson = try toneProto.serializeJSON()
            XCTAssertEqual(toneJson, json)
        }
    }
    static var allTests : [(String, (_ToneTests) -> () throws -> Void)] {
        return [
            ("testJsonDecode", testJsonDecode),
            ("testJsonEncode", testJsonEncode),
        ]
    }
}

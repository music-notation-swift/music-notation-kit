import Foundation
import XCTest
import SwiftProtobuf

import MusicNotationCore
@testable import MusicNotationKit

class _StaffLocationTests: XCTestCase {
    let json = "{\"type\":\"SPACE\",\"number\":1}"
    func testJsonDecode() {
        assertNoErrorThrown {
            let staffLocationProto = try _StaffLocation(json: json)
            let staffLocation = staffLocationProto.transform()
            XCTAssertEqual(staffLocation.locationType, .space)
            XCTAssertEqual(staffLocation.number, 1)
        }
    }

    func testJsonEncode() {
        let staffLocation = StaffLocation(type: .space, number: 1)
        assertNoErrorThrown {
            let staffLocationProto =  staffLocation.transform()
            XCTAssertEqual(staffLocationProto.type, .space)
            XCTAssertEqual(staffLocationProto.number, 1)
            let staffLocationJson = try staffLocationProto.serializeJSON()
            XCTAssertEqual(staffLocationJson, json)
        }
    }
    static var allTests : [(String, (_StaffLocationTests) -> () throws -> Void)] {
        return [
            ("testJsonDecode", testJsonDecode),
            ("testJsonEncode", testJsonEncode),
        ]
    }
}

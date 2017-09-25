/**
 *  ServerCrypto
 *  Copyright (c) 2017 Alexis Aubry. Licensed under the MIT license.
 */

import XCTest
import Foundation
@testable import CryptoSupport

class HexTests: XCTestCase {

    let data = Data(bytes: [0x1a, 0x2b, 0x3c, 0x4d, 0x5e, 0x6f])

    func testDataToHexString() {
        let hexString = data.hexString
        XCTAssertEqual(hexString, "1a2b3c4d5e6f")
    }

    func testDataFromHexString() {

        let data = Data(hexString: "1a2b3c4d5e6f")
        XCTAssertNotNil(data)

        guard data != nil else {
            XCTFail("Could not decode hex string.")
            return
        }

        XCTAssertEqual(data!, Data(bytes: [0x1a, 0x2b, 0x3c, 0x4d, 0x5e, 0x6f]))

    }

    func testDataFromUppercaseHexString() {

        let data = Data(hexString: "1A2B3C4D5E6F")
        XCTAssertNotNil(data)

        guard data != nil else {
            XCTFail("Could not decode hex string.")
            return
        }

        XCTAssertEqual(data!, Data(bytes: [0x1a, 0x2b, 0x3c, 0x4d, 0x5e, 0x6f]))

    }

    func testDataFromOddHexString() {

        let data = Data(hexString: "a2a45")

        guard data != nil else {
            XCTFail("Could not decode hex string.")
            return
        }

        XCTAssertEqual(data, Data(bytes: [0xa2, 0xa4, 0x05]))

    }

    func testDataFromInvalidHexString() {
        let data = Data(hexString: "NOT_A_HEX")
        XCTAssertNil(data)
    }

}

extension HexTests {

    static var allTests : [(String, (HexTests) -> () throws -> Void)] {
        return [
            ("testDataToHexString", testDataToHexString),
            ("testDataFromHexString", testDataFromHexString),
            ("testDataFromUppercaseHexString", testDataFromUppercaseHexString),
            ("testDataFromInvalidHexString", testDataFromInvalidHexString)
        ]
    }

}

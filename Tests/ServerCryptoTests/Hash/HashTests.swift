/**
 *  ServerCrypto
 *  Copyright (c) 2017 Alexis Aubry. Licensed under the MIT license.
 */

import XCTest
import Foundation
@testable import Hash

class HashTests: XCTestCase {

    func testMD4() throws {
        try performTest(with: md4Hashes)
    }

    func testMD5() throws {
        try performTest(with: md5Hashes)
    }

    func testSHA1() throws {
        try performTest(with: sha1Hashes)
    }

    func testSHA224() throws {
        try performTest(with: sha224Hashes)
    }

    func testSHA256() throws {
        try performTest(with: sha256Hashes)
    }

    func testSHA384() throws {
        try performTest(with: sha384Hashes)
    }

    func testSHA512() throws {
        try performTest(with: sha512Hashes)
    }

    func testRipeMd160() throws {
        try performTest(with: ripeMd160Hashes)
    }

    func testNull() throws {
        try performTest(with: nullHashes)
    }

    // MARK: - Utilities

    func performTest(with hashes: [MessageHash]) throws {

        for messageHash in hashes {

            let messageData: Data
            let messageArray: [UInt8]

            switch messageHash.message {
            case .hex(let string):

                guard let _messageData = Data(hexString: string) else {
                    XCTFail("Invalid hex string")
                    return
                }

                messageData = _messageData
                messageArray = [UInt8](messageData)

            case .text(let string):
                messageData = Data(string.utf8)
                messageArray = [UInt8](messageData)

            }

            let computedDataHash = try messageHash.hasher.makeHash(for: messageData)
            let computedArrayHash = try messageHash.hasher.makeHash(for: messageArray)

            XCTAssertEqual(computedDataHash.hexString, messageHash.expectedHash)
            XCTAssertEqual(computedArrayHash.hexString, messageHash.expectedHash)

        }

    }

}

extension HashTests {

    static var allTests : [(String, (HashTests) -> () throws -> Void)] {
        return [
            ("testMD4", testMD4),
            ("testMD5", testMD5),
            ("testSHA1", testSHA1),
            ("testSHA224", testSHA224),
            ("testSHA256", testSHA256),
            ("testSHA384", testSHA384),
            ("testSHA512", testSHA512),
            ("testRipeMd160", testRipeMd160),
            ("testNull", testNull)
        ]
    }

}

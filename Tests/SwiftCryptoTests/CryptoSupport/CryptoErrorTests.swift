/**
 *  SwiftCrypto
 *  Copyright (c) 2017 Alexis Aubry. Licensed under the MIT license.
 */

import XCTest
import Foundation
import CTLS
import Signature
@testable import CryptoSupport

class CryptoErrorTests: XCTestCase {

    func testGetLatestError() throws {

        CryptoProvider.load(.digests, .cryptoErrorStrings)

        let hmacKey = try HMACKey(password: "secret")
        let messageDigest = EVP_sha256()
        let context = EVP_MD_CTX_create()

        defer {
            EVP_MD_CTX_destroy(context)
        }

        /* Invalid Code */

        EVP_DigestVerifyInit(context, nil, messageDigest, nil, hmacKey.underlyingKeyPointer)
        let error = CryptoError.latest

        XCTAssertTrue(error.errorDescription.hasSuffix("operation not supported for this keytype"))
        XCTAssertTrue(error.localizedDescription.hasSuffix("operation not supported for this keytype"))

    }

}

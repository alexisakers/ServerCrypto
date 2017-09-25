/**
 *  SwiftCrypto
 *  Copyright (c) 2017 Alexis Aubry. Licensed under the MIT license.
 */

import XCTest
import Foundation
@testable import Signature


class HMACTests: XCTestCase {

    /// Tests HMAC with MD4.
    func testHMD4() throws {
        try testHMAC(signatures: hmd4Signatures)
        try testHMAC(signatures: hmd4FakeSignatures, isValid: false)
    }
    
    /// Tests HMAC with MD5.
    func testHMD5() throws {
        try testHMAC(signatures: hmd5Signatures)
        try testHMAC(signatures: hmd5FakeSignatures, isValid: false)
    }
    
    /// Tests HMAC with SHA1.
    func testHS1() throws {
        try testHMAC(signatures: hs1Signatures)
        try testHMAC(signatures: hs1FakeSignatures, isValid: false)
    }
    
    /// Tests HMAC with SHA224.
    func testHS224() throws {
        try testHMAC(signatures: hs224Signatures)
        try testHMAC(signatures: hs224FakeSignatures, isValid: false)
    }
    
    /// Tests HMAC with SHA256.
    func testHS256() throws {
        try testHMAC(signatures: hs256Signatures)
        try testHMAC(signatures: hs256FakeSignatures, isValid: false)
    }
    
    /// Tests HMAC with SHA384.
    func testHS384() throws {
        try testHMAC(signatures: hs384Signatures)
        try testHMAC(signatures: hs384FakeSignatures, isValid: false)
    }
    
    /// Tests HMAC with SHA512.
    func testHS512() throws {
        try testHMAC(signatures: hs512Signatures)
        try testHMAC(signatures: hs512FakeSignatures, isValid: false)
    }

    /// Tests HMAC with RIPEMD-160.
    func testHRMD160() throws {
        try testHMAC(signatures: hrmd160Signatures)
        try testHMAC(signatures: hrmd160FakeSignatures, isValid: false)
    }
    
    // MARK: - HMAC Helpers

    func testHMAC(signatures: [HMACSignature], isValid: Bool = true) throws {
        
        let successRequirement = isValid ? true : false
        
        for signature in signatures {

            // 1. Create the key with the passphrase in the vector

            let hmacKey = try HMACKey(password: signature.keyPassword)
            let signer = Signer.hmac(hmacKey)

            // 2. Sign the message with the key

            let computedSignature = try signer.sign(message: Data(signature.message.utf8),
                                                    with: signature.hasher)

            // 3. Verify that the generated signature is valid

            let isSignatureValid = try signer.verify(signature: computedSignature,
                                                     for: Data(signature.message.utf8),
                                                     with: signature.hasher)

            XCTAssertTrue(isSignatureValid)

            // 4. Verify that the library recognizes valid and invalid signatures

            let verificationResult = try signer.verify(signature: Data(hexString: signature.expectedSignature)!,
                                                       for: Data(signature.message.utf8),
                                                       with: signature.hasher)

            XCTAssertTrue(verificationResult == successRequirement)

            // 5. Verify that the signature is equal to the expected signature (or not equal if the test vector is fake)

            XCTAssertTrue((computedSignature.hexString == signature.expectedSignature) == successRequirement)

        }
        
    }
    
}

extension HMACTests {
    
    ///
    /// All the tests to run on Linux.
    ///
    
    static var allTests : [(String, (HMACTests) -> () throws -> Void)] {
        return [
            ("testHMD4", testHMD4),
            ("testHMD5", testHMD5),
            ("testHS1", testHS1),
            ("testHS224", testHS224),
            ("testHS256", testHS256),
            ("testHS384", testHS384),
            ("testHS512", testHS512),
            ("testHRMD160", testHRMD160),
        ]
    }
    
}

/**
 *  ServerCrypto
 *  Copyright (c) 2017 Alexis Aubry. Licensed under the MIT license.
 */

import XCTest
import Foundation
@testable import Signature

class RSATests: XCTestCase {
    
    /// Tests RSA with MD4.
    func testRMD4() throws {
        
        try SignatureTestsCoordinator.testSignatures(rsa1024withMD4Signatures)
        try SignatureTestsCoordinator.testSignatures(rsa2048withMD4Signatures)
        
        try SignatureTestsCoordinator.testSignatures(rsa1024withMD4FakeSignatures, isValid: false)
        try SignatureTestsCoordinator.testSignatures(rsa2048withMD4FakeSignatures, isValid: false)
        
    }
    
    /// Tests RSA with MD5.
    func testRMD5() throws {

        try SignatureTestsCoordinator.testSignatures(rsa1024withMD5Signatures)
        try SignatureTestsCoordinator.testSignatures(rsa2048withMD5Signatures)
        
        try SignatureTestsCoordinator.testSignatures(rsa1024withMD5FakeSignatures, isValid: false)
        try SignatureTestsCoordinator.testSignatures(rsa2048withMD5FakeSignatures, isValid: false)
        
    }
    
    /// Tests RSA with SHA1.
    func testRS1() throws {
        
        try SignatureTestsCoordinator.testSignatures(rsa1024withSHA1Signatures)
        try SignatureTestsCoordinator.testSignatures(rsa2048withSHA1Signatures)
        
        try SignatureTestsCoordinator.testSignatures(rsa1024withSHA1FakeSignatures, isValid: false)
        try SignatureTestsCoordinator.testSignatures(rsa2048withSHA1FakeSignatures, isValid: false)
        
    }
    
    /// Tests RSA with SHA224.
    func testRS224() throws {
        
        try SignatureTestsCoordinator.testSignatures(rsa1024withSHA224Signatures)
        try SignatureTestsCoordinator.testSignatures(rsa2048withSHA224Signatures)
        
        try SignatureTestsCoordinator.testSignatures(rsa1024withSHA224FakeSignatures, isValid: false)
        try SignatureTestsCoordinator.testSignatures(rsa2048withSHA224FakeSignatures, isValid: false)
        
    }
    
    /// Tests RSA with SHA256.
    func testRS256() throws {
        
        try SignatureTestsCoordinator.testSignatures(rsa1024withSHA256Signatures)
        try SignatureTestsCoordinator.testSignatures(rsa2048withSHA256Signatures)
        
        try SignatureTestsCoordinator.testSignatures(rsa1024withSHA256FakeSignatures, isValid: false)
        try SignatureTestsCoordinator.testSignatures(rsa2048withSHA256FakeSignatures, isValid: false)
        
    }
    
    /// Tests RSA with SHA384.
    func testRS384() throws {
        
        try SignatureTestsCoordinator.testSignatures(rsa1024withSHA384Signatures)
        try SignatureTestsCoordinator.testSignatures(rsa2048withSHA384Signatures)
        
        try SignatureTestsCoordinator.testSignatures(rsa1024withSHA384FakeSignatures, isValid: false)
        try SignatureTestsCoordinator.testSignatures(rsa2048withSHA384FakeSignatures, isValid: false)
        
    }
    
    /// Tests RSA with SHA512.
    func testRS512() throws {
        
        try SignatureTestsCoordinator.testSignatures(rsa1024withSHA512Signatures)
        try SignatureTestsCoordinator.testSignatures(rsa2048withSHA512Signatures)
        
        try SignatureTestsCoordinator.testSignatures(rsa1024withSHA512FakeSignatures, isValid: false)
        try SignatureTestsCoordinator.testSignatures(rsa2048withSHA512FakeSignatures, isValid: false)
        
    }

    /// Tests RSA with RIPEMD160.
    func testRRMD160() throws {

        try SignatureTestsCoordinator.testSignatures(rsa1024withRIPEMD160Signatures)
        try SignatureTestsCoordinator.testSignatures(rsa2048withRIPEMD160Signatures)
        
        try SignatureTestsCoordinator.testSignatures(rsa1024withRIPEMD160FakeSignatures, isValid: false)
        try SignatureTestsCoordinator.testSignatures(rsa2048withRIPEMD160FakeSignatures, isValid: false)
        
    }

}

extension RSATests {
    
    static var allTests : [(String, (RSATests) -> () throws -> Void)] {
        return [
            ("testRMD4", testRMD4),
            ("testRMD5", testRMD5),
            ("testRS1", testRS1),
            ("testRS224", testRS224),
            ("testRS256", testRS256),
            ("testRS384", testRS384),
            ("testRS512", testRS512),
            ("testRRMD160", testRRMD160),
        ]
    }
    
}

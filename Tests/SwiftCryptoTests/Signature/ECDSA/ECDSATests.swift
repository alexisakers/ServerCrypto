/**
 *  SwiftCrypto
 *  Copyright (c) 2017 Alexis Aubry. Licensed under the MIT license.
 */

import XCTest
import Foundation
@testable import Signature

class ECDSATests: XCTestCase {

    /// Tests ECDSA with SHA1.
    func testES1() throws {
        
        try SignatureTestsCoordinator.testSignatures(ecdsaP256withSHA1Signatures)
        try SignatureTestsCoordinator.testSignatures(ecdsaP384withSHA1Signatures)
        try SignatureTestsCoordinator.testSignatures(ecdsaSECP256K1withSHA1Signatures)
        
        try SignatureTestsCoordinator.testSignatures(ecdsaFakeP256withSHA1Signatures, isValid: false)
        try SignatureTestsCoordinator.testSignatures(ecdsaFakeP384withSHA1Signatures, isValid: false)
        try SignatureTestsCoordinator.testSignatures(ecdsaFakeSECP256K1withSHA1Signatures, isValid: false)
        
    }
    
    /// Tests ECDSA with SHA224.
    func testES224() throws {
        
        try SignatureTestsCoordinator.testSignatures(ecdsaP256withSHA224Signatures)
        try SignatureTestsCoordinator.testSignatures(ecdsaP384withSHA224Signatures)
        try SignatureTestsCoordinator.testSignatures(ecdsaSECP256K1withSHA224Signatures)
        
        try SignatureTestsCoordinator.testSignatures(ecdsaFakeP256withSHA224Signatures, isValid: false)
        try SignatureTestsCoordinator.testSignatures(ecdsaFakeP384withSHA224Signatures, isValid: false)
        try SignatureTestsCoordinator.testSignatures(ecdsaFakeSECP256K1withSHA224Signatures, isValid: false)
        
    }
    
    /// Tests ECDSA with SHA256.
    func testES256() throws {
        
        try SignatureTestsCoordinator.testSignatures(ecdsaP256withSHA256Signatures)
        try SignatureTestsCoordinator.testSignatures(ecdsaP384withSHA256Signatures)
        try SignatureTestsCoordinator.testSignatures(ecdsaSECP256K1withSHA256Signatures)
        
        try SignatureTestsCoordinator.testSignatures(ecdsaFakeP256withSHA256Signatures, isValid: false)
        try SignatureTestsCoordinator.testSignatures(ecdsaFakeP384withSHA256Signatures, isValid: false)
        try SignatureTestsCoordinator.testSignatures(ecdsaFakeSECP256K1withSHA256Signatures, isValid: false)
        
    }
    
    /// Tests ECDSA with SHA384.
    func testES384() throws {
        
        try SignatureTestsCoordinator.testSignatures(ecdsaP256withSHA384Signatures)
        try SignatureTestsCoordinator.testSignatures(ecdsaP384withSHA384Signatures)
        try SignatureTestsCoordinator.testSignatures(ecdsaSECP256K1withSHA384Signatures)
        
        try SignatureTestsCoordinator.testSignatures(ecdsaFakeP256withSHA384Signatures, isValid: false)
        try SignatureTestsCoordinator.testSignatures(ecdsaFakeP384withSHA384Signatures, isValid: false)
        try SignatureTestsCoordinator.testSignatures(ecdsaFakeSECP256K1withSHA384Signatures, isValid: false)
        
    }
    
    /// Tests ECDSA with SHA512.
    func testES512() throws {
        
        try SignatureTestsCoordinator.testSignatures(ecdsaP256withSHA512Signatures)
        try SignatureTestsCoordinator.testSignatures(ecdsaP384withSHA512Signatures)
        try SignatureTestsCoordinator.testSignatures(ecdsaSECP256K1withSHA512Signatures)
        
        try SignatureTestsCoordinator.testSignatures(ecdsaFakeP256withSHA512Signatures, isValid: false)
        try SignatureTestsCoordinator.testSignatures(ecdsaFakeP384withSHA512Signatures, isValid: false)
        try SignatureTestsCoordinator.testSignatures(ecdsaFakeSECP256K1withSHA512Signatures, isValid: false)
        
    }

}

extension ECDSATests {
    
    static var allTests : [(String, (ECDSATests) -> () throws -> Void)] {
        return [
            ("testES1", testES1),
            ("testES224", testES224),
            ("testES256", testES256),
            ("testES384", testES384),
            ("testES512", testES512)
        ]
    }
    
}

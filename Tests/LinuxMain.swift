import XCTest
@testable import SwiftCryptoTests

XCTMain([
    testCase(HexTests.allTests),
    testCase(CryptoErrorTests.allTests),
    testCase(HashTests.allTests),
    testCase(HMACTests.allTests),
    testCase(ECDSATests.allTests),
    testCase(RSATests.allTests),
])

import XCTest
@testable import ServerCryptoTests

XCTMain([
    testCase(HexTests.allTests),
    testCase(CryptoErrorTests.allTests),
    testCase(HashTests.allTests),
    testCase(HMACTests.allTests),
    testCase(ECDSATests.allTests),
    testCase(RSATests.allTests),
])

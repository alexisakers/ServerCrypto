/**
 *  SwiftCrypto
 *  Copyright (c) 2017 Alexis Aubry. Licensed under the MIT license.
 */

import XCTest
import Foundation

class SignatureTestsCoordinator {

    static func path(ofKey keyName: String) -> String? {
        
        #if os(OSX)
            let bundle = Bundle(for: SignatureTestsCoordinator.self)
            return bundle.path(forResource: keyName, ofType: "pem")
        #else
            let fixturesPath = NSString(string: "~/Signature-TestFixtures").expandingTildeInPath
            let keyPath = fixturesPath + "/" + keyName + ".pem"
            return FileManager.default.fileExists(atPath: keyPath) ? keyPath : nil
        #endif
        
    }

    static func pemData(ofKey keyName: String) -> Data? {

        guard let path = SignatureTestsCoordinator.path(ofKey: keyName) else {
            return nil
        }

        let url = URL(fileURLWithPath: path)
        return try? Data(contentsOf: url, options: .uncached)

    }

}

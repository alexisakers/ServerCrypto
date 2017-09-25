/**
 *  ServerCrypto
 *  Copyright (c) 2017 Alexis Aubry. Licensed under the MIT license.
 */

import XCTest
import Foundation
import Signature

class SignatureTestsCoordinator {}

// MARK: - Key Loading

extension SignatureTestsCoordinator {

    static func path(ofKey keyName: String) -> String? {

        #if Xcode
            let bundle = Bundle(for: SignatureTestsCoordinator.self)
            return bundle.path(forResource: keyName, ofType: "pem", inDirectory: "TestFixtures")
        #else
            let cWorkingDirectory = getenv("PWD")!
            let fixturesPath = String(cString: cWorkingDirectory) + "/TestFixtures"
            let keyPath = fixturesPath + "/" + keyName + ".pem"
            return FileManager.default.fileExists(atPath: keyPath) ? keyPath : nil
        #endif

    }

    static func pemData(at path: String) -> Data? {
        let url = URL(fileURLWithPath: path)
        return try? Data(contentsOf: url, options: .uncached)
    }

}

// MARK: - Key Testing

protocol AsymmetricSignature {

    var hasher: Hasher { get }
    var message: String { get }

    var publicKeyName: String { get }
    var privateKeyName: String { get }
    var privateKeyPassphrase: String? { get }

    var validSignature: String { get }

}

extension SignatureTestsCoordinator {

    static func testSignatures<S: AsymmetricSignature>(_ signatures: [S], isValid: Bool = true) throws {

        let successRequirement = isValid ? true : false

        for signature in signatures {

            guard let publicKeyPath = SignatureTestsCoordinator.path(ofKey: signature.publicKeyName),
                let privateKeyPath = SignatureTestsCoordinator.path(ofKey: signature.privateKeyName) else {
                XCTFail("Cannot find keys on disk.")
                return
            }

            guard let publicKeyData = SignatureTestsCoordinator.pemData(at: publicKeyPath),
                let privateKeyData = SignatureTestsCoordinator.pemData(at: privateKeyPath) else {
                XCTFail("Cannot read data from keys.")
                    return
            }

            // 1. Load the keys

            let publicDiskKey = try AsymmetricKey.makePublicKey(readingPEMAtPath: publicKeyPath)
            let privateDiskKey = try AsymmetricKey.makePrivateKey(readingPEMAtPath: privateKeyPath, passphrase: signature.privateKeyPassphrase)

            let publicMemoryKey = try AsymmetricKey.makePublicKey(readingPEMData: publicKeyData)
            let privateMemoryKey = try AsymmetricKey.makePrivateKey(readingPEMData: privateKeyData, passphrase: signature.privateKeyPassphrase)

            let testKeys = [(publicDiskKey, privateDiskKey), (publicMemoryKey, privateMemoryKey)]

            for (publicKey, privateKey) in testKeys {

                let privateSigner = Signer.asymmetric(privateKey)
                let publicSigner = Signer.asymmetric(publicKey)

                // 2. Compute the signature of the message

                let messageData = signature.message.data(using: .utf8)!
                let generatedSignature = try privateSigner.sign(message: messageData, with: signature.hasher)

                // 3. Assert that the computed signature is valid

                let isSignatureValid = try publicSigner.verify(signature: generatedSignature, for: messageData, with: signature.hasher)

                XCTAssertTrue(isSignatureValid)

                // 4. Verify that the library recognizes valid and invalid signatures

                let testSignature = Data(hexString: signature.validSignature)!
                let verificationResult = try publicSigner.verify(signature: testSignature, for: messageData, with: signature.hasher)

                XCTAssertTrue(verificationResult == successRequirement)

            }

        }

    }
}


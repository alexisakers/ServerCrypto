/**
 *  SwiftCrypto
 *  Copyright (c) 2017 Alexis Aubry. Licensed under the MIT license.
 */

import Foundation
import CryptoSupport
import CTLS

/**
 * A key composed of a public and private part for use in asymmetic signature algorithms.
 */

public class KeyPair {

    /**
     * An enumeration of the components of keys.
     */

    public enum Component {

        /// The public part of the key.
        case publicKey

        /// The private part of the key, optionally protected with a passphrase.
        case privateKey(passphrase: String?)

    }

    // MARK: - Properties

    /// The component contained in the key.
    public let component: Component

    public let underlyingKeyPointer: UnsafeMutablePointer<EVP_PKEY>

    // MARK: - Lifecycle

    /**
     * Create a key by reading one of its components at the given path.
     * - parameter path: The path to the key component to read.
     * - parameter component: The component to include in the key.
     * - throws: In case of failure, this initializer throws a `CryptoError` object.
     */

    public convenience init(path: String, component: Component) throws {

        CryptoProvider.load(.digests, .ciphers, .cryptoErrorStrings)

        guard let bio = BIO_new_file(path, "r") else {
            throw CryptoError.latest
        }

        try self.init(bio: bio, component: component)

    }

    /**
     * Create a key by reading one of its components from a PEM-encoded data buffer.
     * - parameter pemData: The PEM data containing the component to read.
     * - parameter component: The component to include in the key.
     * - throws: In case of failure, this initializer throws a `CryptoError` object.
     */

    public convenience init(pemData: Data, component: Component) throws {

        CryptoProvider.load(.digests, .ciphers, .cryptoErrorStrings)

        let optionalBio = pemData.withUnsafeRawBytes {
            BIO_new_mem_buf($0, Int32(pemData.count))
        }

        guard let bio = optionalBio else {
            throw CryptoError.latest
        }

        try self.init(bio: bio, component: component)

    }

    private init(bio: UnsafeMutablePointer<BIO>, component: Component) throws {

        switch component {

        case .publicKey:

            guard let pubKey = PEM_read_bio_PUBKEY(bio, nil, nil, nil) else {
                throw CryptoError.latest
            }

            underlyingKeyPointer = pubKey

        case .privateKey(let passphrase):

            let passphraseBytes = passphrase?.withCString { UnsafeMutableRawPointer(mutating: $0) }

            guard let pkey = PEM_read_bio_PrivateKey(bio, nil, { KeyPair.password_cb($0, $1, $2, $3) }, passphraseBytes) else {
                throw CryptoError.latest
            }

            underlyingKeyPointer = pkey

        }

        self.component = component

    }

    deinit {
        EVP_PKEY_free(underlyingKeyPointer)
    }

}

// MARK: - Utilities

extension KeyPair {

    private static func password_cb(_ buf: UnsafeMutablePointer<Int8>?, _ bufferSize: Int32, _ rwflag: Int32, _ password: UnsafeMutableRawPointer?) -> Int32 {

        guard buf != nil else {
            return 0
        }

        guard password != nil else {
            strcpy(buf!, "")
            return 0
        }

        let ptr = password!.assumingMemoryBound(to: Int8.self)

        var n = Int32(strlen(ptr))

        if n >= bufferSize {
            n = bufferSize - 1
        }

        memcpy(buf!, password!, Int(n))

        return n

    }

}

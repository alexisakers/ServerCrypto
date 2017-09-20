/**
 *  JavaScriptKit
 *  Copyright (c) 2017 Alexis Aubry. Licensed under the MIT license.
 */

import Foundation
import CTLS

/**
 * The structured representation of an OpenSSL error.
 */

public struct CryptoError {

    // MARK: - Properties

    /// The code of the error.
    public let code: UInt

    /// The description of the error.
    public let localizedDescription: String

    // MARK: - Lifecycle

    /**
     * Creates an error descriptor.
     * - parameter code: The code of the error.
     * - parameter localizedDescription: The description of the error.
     */

    private init(code: UInt, localizedDescription: String) {
        self.code = code
        self.localizedDescription = localizedDescription
    }

    // MARK: - Getting the Latest Error

    /**
     * The latest error thrown by the OpenSSL library.
     * - returns: The object describing the latest error.
     */

    public static var latest: CryptoError {

        let code = ERR_get_error()

        var errorStringBuffer = [Int8]()
        ERR_error_string(code, &errorStringBuffer)

        let localizedDescription = String(cString: &errorStringBuffer)
        return CryptoError(code: code, localizedDescription: localizedDescription)

    }

}

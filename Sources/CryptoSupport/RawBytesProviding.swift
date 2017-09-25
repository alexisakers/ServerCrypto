/**
 *  SwiftCrypto
 *  Copyright (c) 2017 Alexis Aubry. Licensed under the MIT license.
 */

import Foundation

/**
 * Provides a raw bytes-represented version of itself.
 */

public protocol RawBytesProviding {

    /**
     * Executes a closure against the raw bytes in the data's buffer.
     */

    func withUnsafeRawBytes<ResultType>(_ body: (UnsafeRawPointer) throws -> ResultType) rethrows -> ResultType

}

extension Data: RawBytesProviding {

    public func withUnsafeRawBytes<ResultType>(_ body: (UnsafeRawPointer) throws -> ResultType) rethrows -> ResultType {
        return try self.withUnsafeBytes {
            try body(UnsafeRawPointer($0))
        }
    }


}

extension Array: RawBytesProviding {

    public func withUnsafeRawBytes<ResultType>(_ body: (UnsafeRawPointer) throws -> ResultType) rethrows -> ResultType {
        let rawPointer = UnsafeRawPointer(self)
        return try body(rawPointer)
    }

}

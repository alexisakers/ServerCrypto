# ServerCrypto

[![Build Status](https://travis-ci.org/alexaubry/ServerCrypto.svg?branch=master)](https://travis-ci.org/alexaubry/ServerCrypto)
[![Requires Swift 4.0](https://img.shields.io/badge/Swift-4.0-ee4f37.svg)]()

ServerCrypto is a library that makes server-side cryptography easy in Swift.

## Installation

To use ServerCrypto in your project, add this line to your `Package.swift`:

~~~swift
.package(url: "https://github.com/alexaubry/ServerCrypto", from: "1.0.0")
~~~

Make sure you have OpenSSL installed before using the library.

On macOS, you need to provide the following flags to build or test from the command line:

~~~bash
swift build -Xswiftc -I/usr/local/opt/openssl/include -Xlinker -L/usr/local/opt/openssl/lib
~~~

## Features

- [Hashing](#hashing)
- [HMAC Signature](#hmac-signature)
- HMAC Verification
- Asymmetric Signature
- Asymmetric Signature Verification

### Hashing

To compute the hash of a sequence of bytes, you use an instance of `Hasher`.

`Hasher` can generate hashes for `Data`, `[UInt8]` ; and any type than conforms to the `Bytes` protocols.

The following hashing algorithms are supported:

~~~
.md4 .md5 .sha1 .sha224 .sha256 .sha384 .sha512 .ripeMd160
~~~

#### Example

To compute the SHA-256 hash of a String, write the following code:

~~~swift
let hasher = Hasher.sha256

let messageData = "Hello world".data(using: .utf8)!
let hashData = try hasher.makeHash(for: messageData) // Returns a Data object
let hashHexString = hashData.hexString
~~~

Result = `64ec88ca00b268e5ba1a35678a1b5316d212f4f366b2477232534a8aeca37f3c`


### HMAC Signature








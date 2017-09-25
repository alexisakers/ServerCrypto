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
- [HMAC Verification](#hmac-verification)
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
import Hash

let hasher = Hasher.sha256

let messageData = "Hello world".data(using: .utf8)!
let hashData = try hasher.makeHash(for: messageData) // Returns a Data object
let hashHexString = hashData.hexString
~~~

### HMAC Signature

To create an HMAC signature, you need:

- A message digest / hashing algorithm
- A key with a password
- A message to sign

You use an instance of `Signer` to generate an HMAC signature. Any type supported by [`Hasher`](#hashing) is also supported by `Signer`.

#### Example

To compute the SHA-256 HMAC of a String, you need to follow these steps:

**1-** Create an HMAC key with a password

~~~swift
import Signature

let key = try HMACKey(password: "secret")
~~~

**2-** Create an HMAC signer

~~~swift
let signer = Signer.hmac(key)
~~~

**3-** Get the HMAC for the message

~~~swift
let messageData = "Hello world".data(using: .utf8)!
let hmacData = signer.sign(messageData, with: .sha256) // Returns a Data object
let hmacHexString = hmacData.hexString
~~~

### HMAC Verification

To verify that an HMAC signature is valid for the message you expect, you need:

- A message digest / hashing algorithm
- A key with an expected password
- An expected message
- A signature to verify

You use an instance of `Signer` to verify an HMAC signature. The signature must be a `Data` object. The expected message can be any type supported by [`Hasher`](#hashing).

#### Example

To verify the SHA-256 HMAC of a String, you need to follow these steps:

**1-** Create an HMAC key with the expected password

~~~swift
import Signature

let key = try HMACKey(password: "secret")
~~~

**2-** Create an HMAC signer

~~~swift
let signer = Signer.hmac(key)
~~~

**3-** Verify the HMAC for the message

~~~swift
let hmacData = ...
let messageData = "Hello world".data(using: .utf8)!
let isValid = signer.verify(signature: hmacData, for: messageData, with: .sha256) // Returns a Bool
~~~



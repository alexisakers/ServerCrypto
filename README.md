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
- [Asymmetric Signature](#asymmetric-signature)
- [Asymmetric Signature Verification](#asymmetric-signature-verification)

## Hashing

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

## HMAC Signature

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

## HMAC Verification

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

## Asymmetric Signature

Signature.framework can generate signatures using private keys and algorithms like RSA and ECDSA.

To create a signature, you need:

- A message digest / hashing algorithm
- A private PEM-encoded key
- A message to sign

You use an instance of `Signer` to generate a signature. Any type supported by [`Hasher`](#hashing) is also supported by `Signer`.

#### Example

To compute the SHA-256 ECDSA signature of a String, you need to follow these steps:

**1-** Load a private key from a PEM file:

~~~swift
import Signature

let privateKey = try AsymmetricKey.makePrivateKey(readingPEMAtPath: "path/to/public/key.pem", passphrase: "...")
~~~

You can also load a PEM key from memory using `AsymmetricKey.makePrivateKey(readingPEMData: Data,passphrase: String?)`.

**2-** Create an asymmetric signer

~~~swift
let signer = Signer.asymmetric(privateKey)
~~~

**3-** Get the signature for the message

~~~swift
let messageData = "Hello world".data(using: .utf8)!
let hmacData = signer.sign(messageData, with: .sha256) // Returns a Data object
let hmacHexString = hmacData.hexString
~~~

## Asymmetric Signature Verification

To verify that a signature is valid for the message you expect, you need:

- A message digest / hashing algorithm
- The public key associated with the expected private key
- An expected message
- A signature to verify

You use an instance of `Signer` to verify a signature. The signature must be a `Data` object. The expected message can be any type supported by [`Hasher`](#hashing).

#### Example

To verify that a SHA-256 ECDSA signature of a String is valid for the public key, you need to follow these steps:

**1-** Load the public key from a PEM file

~~~swift
import Signature

let publicKey = try AsymmetricKey.makePublicKey(readingPEMAtPath: "path/to/private/key.pem")
~~~

You can also load the key from memory using `AsymmetricKey.makePublicKey(readingPEMData: Data)`.

**2-** Create an asymmetric signer

~~~swift
let signer = Signer.asymmetric(publicKey)
~~~

**3-** Verify the signatrure for the message

~~~swift
let hmacData = ...
let messageData = "Hello world".data(using: .utf8)!
let isValid = signer.verify(signature: hmacData, for: messageData, with: .sha256) // Returns a Bool
~~~

## Author

Alexis Aubry, me@alexaubry.fr

You can find me on Twitter : [@_alexaubry](https://twitter.com/_alexaubry)

## License

ServerCrypto is available under the MIT License. See the [LICENSE](LICENSE) file for more info.

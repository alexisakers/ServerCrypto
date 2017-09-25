# ServerCrypto

[![Build Status](https://travis-ci.org/alexaubry/ServerCrypto.svg?branch=master)](https://travis-ci.org/alexaubry/ServerCrypto)
[![Requires Swift 4.0](https://img.shields.io/badge/Swift-4.0-ee4f37.svg)]()

ServerCrypto is a Swift library that brings easy cryptography to the server.

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

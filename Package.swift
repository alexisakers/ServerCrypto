// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "ServerCrypto",
    products: [
        .library(name: "CryptoSupport", targets: ["CryptoSupport"]),
        .library(name: "Hash", targets: ["Hash"]),
        .library(name: "Signature", targets: ["Signature"])
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/ctls", from: "1.1.0")
    ],
    targets: [
        .target(name: "CryptoSupport", dependencies: []),
        .target(name: "Hash", dependencies: ["CryptoSupport"]),
        .target(name: "Signature", dependencies: ["CryptoSupport", "Hash"]),
        .testTarget(name: "ServerCryptoTests",dependencies: ["CryptoSupport", "Hash", "Signature"])
    ]
)

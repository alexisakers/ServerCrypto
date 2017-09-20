// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "SwiftCrypto",
    products: [
        .library(name: "Hash", targets: ["Hash"]),
        .library(name: "Signature", targets: ["Signature"])
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/ctls", from: "1.1.0"),
    ],
    targets: [
        .target(name: "CryptoSupport", dependencies: []),
        .target(name: "Hash", dependencies: ["CryptoSupport"]),
        .target(name: "Signature", dependencies: ["CryptoSupport"]),
        .testTarget(name: "SwiftCryptoTests",dependencies: ["Hash", "Signature"]),
    ]
)

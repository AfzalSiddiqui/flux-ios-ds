// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "FluxTokensKit",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "FluxTokensKit",
            targets: ["FluxTokensKit"]
        )
    ],
    targets: [
        .target(
            name: "FluxTokensKit"
        )
    ]
)

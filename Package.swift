// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "flux-ios-ds",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "flux-ios-ds",
            targets: ["flux-ios-ds"]
        )
    ],
    targets: [
        .target(
            name: "flux-ios-ds",
            path: "Sources/flux-ios-ds"
        )
    ]
)

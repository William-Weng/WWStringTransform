// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WWStringTransform",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(name: "WWStringTransform", targets: ["WWStringTransform"]),
    ],
    targets: [
        .target(name: "WWStringTransform", resources: [.copy("Privacy")]),
    ],
    swiftLanguageVersions: [
        .v5
    ]
)

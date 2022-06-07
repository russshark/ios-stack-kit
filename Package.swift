// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StackKitRusssshark",
    platforms: [ .iOS(.v9)],
    products: [
        .library(
            name: "StackKitRusssshark",
            targets: ["StackKit"]),
    ],
    dependencies: [
        .package(
            name: "ConstraintKit",
            url: "https://github.com/russshark/ios-constraint-kit.git",
            .branch("russshark/ios-9-fix")
        )
    ],
    targets: [
        .target(
            name: "StackKitRusssshark",
            dependencies: ["ConstraintKit"]),
        .testTarget(
            name: "StackKitTests",
            dependencies: ["StackKit"]),
    ]
)

// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MarvelManagers",
    platforms: [
        .iOS(.v12),
        .watchOS(.v6),
        .tvOS(.v12)
    ],
    products: [
        .library(
            name: "ReachabilityManager",
            targets: ["ReachabilityManager"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ReachabilityManager",
            dependencies: []),
        .testTarget(
            name: "ReachabilityManagerTests",
            dependencies: ["ReachabilityManager"]),
    ]
)

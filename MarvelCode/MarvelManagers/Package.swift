// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MarvelPackage",
    platforms: [
        .iOS(.v12),
        .watchOS(.v6),
        .tvOS(.v12)
    ],
    products: [
        .library(
            name: "ReachabilityManager",
            type: .dynamic ,
            targets: ["ReachabilityManager"]),
        .library(
            name: "ConnectionManager",
            type: .dynamic,
            targets: ["ConnectionManager"]),
        .library(
            name: "CryptoManager",
            type: .dynamic,
            targets: ["CryptoManager"]),
        .library(
            name: "Helpers",
            type: .dynamic,
            targets: ["Helpers"]),
        .library(
            name: "MarvelAPIManager",
            type: .dynamic,
            targets: ["MarvelAPIManager"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ReachabilityManager",
            dependencies: []),
        .target(
            name: "ConnectionManager"),
        .target(
            name: "CryptoManager"),
        .target(
            name: "Helpers"),
        .target(
            name: "MarvelAPIManager"),
        
        .testTarget(
            name: "ReachabilityManagerTests",
            dependencies: ["ReachabilityManager"]),
        .testTarget(
            name: "ConnectionManagerTests",
            dependencies: ["ConnectionManager"]),
        .testTarget(
            name: "CryptoManagerTests",
            dependencies: ["CryptoManager"])
    ]
)

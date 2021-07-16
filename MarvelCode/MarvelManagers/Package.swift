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
            name: "Helpers",
            type: .dynamic,
            targets: ["Helpers"]),
        .library(
            name: "MarvelUIKitManager",
            targets: ["MarvelUIKitManager"])
    ],
    dependencies: [
        .package(url: "https://github.com/CodeNationDev/SimplyLogger.git", .exact("0.0.7")),
        .package(name: "SwiftMagicHelpers", url: "https://github.com/CodeNationDev/SwiftMagicHelpers.git", .branch("develop"))
    ],
    targets: [
        .target(
            name: "ReachabilityManager"),
        .target(
            name: "ConnectionManager"),
        .target(
            name: "Helpers"),
        .target(
            name: "MarvelUIKitManager",
            dependencies: [.byName(name: "SimplyLogger"),
                           .byName(name: "SwiftMagicHelpers")
            ],
            resources: [
                .process("Resources/Fonts/Marvel-Regular.ttf"),
            ]),
        
        .testTarget(
            name: "ReachabilityManagerTests",
            dependencies: ["ReachabilityManager"]),
        .testTarget(
            name: "ConnectionManagerTests",
            dependencies: ["ConnectionManager"])
    ]
)

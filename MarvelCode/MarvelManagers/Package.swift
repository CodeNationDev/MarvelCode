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
            name: "APIManager",
            targets: ["APIManager"]),
        .library(
            name: "Helpers",
            type: .dynamic,
            targets: ["Helpers"]),
        .library(
            name: "MarvelUIKitManager",
            targets: ["MarvelUIKitManager"]),
        .library(
            name: "Constants",
            targets: ["Constants"]),
    ],
    dependencies: [
        .package(url: "https://github.com/CodeNationDev/SimplyLogger.git", .exact("0.0.8")),
        .package(name: "SwiftMagicHelpers", url: "https://github.com/CodeNationDev/SwiftMagicHelpers.git", .branch("develop")),
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", .exact("1.4.1")),
        .package(url: "https://github.com/Alamofire/Alamofire.git", .exact("5.4.3")),
        .package(name: "Firebase",
                       url: "https://github.com/firebase/firebase-ios-sdk.git",
                       .branch("7.0-spm-beta")),
    ],
    targets: [
        .target(
            name: "ReachabilityManager"),
        .target(
            name: "APIManager",
            dependencies: [.byName(name: "CryptoSwift"),
                           .byName(name: "Constants"),
                           .byName(name: "SimplyLogger")]),
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
        .target(
            name: "Constants"),
        .testTarget(
            name: "APIManagerTests",
            dependencies: ["APIManager", "SimplyLogger", "Alamofire", "SwiftMagicHelpers", "ReachabilityManager"])
    ]
)

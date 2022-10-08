// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftWasmPuzzle",
    platforms: [.macOS(.v12), .iOS(.v15)],
    products: [
        .executable(name: "SwiftWasmPuzzleWeb",
                    targets: ["SwiftWasmPuzzleWeb"]),
        .library(
            name: "PuzzleLibrary",
            targets: ["PuzzleLibrary"]),
    ],
    dependencies: [
        .package(url: "https://github.com/TokamakUI/Tokamak",
                 from: "0.11.0"),
    ],
    targets: [
        .executableTarget(
            name: "SwiftWasmPuzzleWeb",
            dependencies: [
                "PuzzleLibrary",
                .product(name: "TokamakShim", package: "Tokamak"),
            ]),
        .target(
            name: "PuzzleLibrary",
            dependencies: []),
        .testTarget(
            name: "PuzzleLibraryTests",
            dependencies: ["PuzzleLibrary"]),
    ]
)

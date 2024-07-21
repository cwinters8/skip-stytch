// swift-tools-version: 5.9
// This is a Skip (https://skip.tools) package,
// containing a Swift Package Manager project
// that will use the Skip build plugin to transpile the
// Swift Package, Sources, and Tests into an
// Android Gradle Project with Kotlin sources and JUnit tests.
import PackageDescription

let package = Package(
    name: "skip-stytch",
    defaultLocalization: "en",
    platforms: [.iOS(.v16), .macOS(.v13), .tvOS(.v16), .watchOS(.v9), .macCatalyst(.v16)],
    products: [
        .library(name: "SkipStytch", type: .dynamic, targets: ["SkipStytch"]),
    ],
    dependencies: [
        .package(url: "https://source.skip.tools/skip.git", from: "0.10.6"),
        .package(url: "https://source.skip.tools/skip-foundation.git", from: "0.0.0")
    ],
    targets: [
        .target(name: "SkipStytch", dependencies: [.product(name: "SkipFoundation", package: "skip-foundation")], resources: [.process("Resources")], plugins: [.plugin(name: "skipstone", package: "skip")]),
        .testTarget(name: "SkipStytchTests", dependencies: ["SkipStytch", .product(name: "SkipTest", package: "skip")], resources: [.process("Resources")], plugins: [.plugin(name: "skipstone", package: "skip")]),
    ]
)

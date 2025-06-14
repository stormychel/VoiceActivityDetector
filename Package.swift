// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "VoiceActivityDetector",
    platforms: [
        .iOS(.v8),
        .macOS(.v10_12),
    ],
    products: [
        .library(
            name: "VoiceActivityDetector",
            targets: ["VoiceActivityDetector"]
        ),
    ],
    dependencies: [],
)    targets: [
        // Embedded libfvad C library
        .target(
            name: "libfvad",
            path: "Sources/libfvad",
            publicHeadersPath: "include"
        ),
        // Swift interface
        .target(
            name: "VoiceActivityDetector",
            dependencies: ["libfvad"],
            path: "VoiceActivityDetector/Classes"
        ),
    ]
)
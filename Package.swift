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
    targets: [
        .systemLibrary(
            name: "libfvad",
            pkgConfig: "libfvad",
            providers: [
                .brew(["libfvad"]),
                .apt(["libfvad-dev"]),
            ]
        ),
        .target(
            name: "VoiceActivityDetector",
            dependencies: ["libfvad"],
            path: "VoiceActivityDetector/Classes"
        ),
    ]
)
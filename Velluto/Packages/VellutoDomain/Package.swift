// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "VellutoDomain",
    platforms: [.iOS(.v26)],
    products: [
        .library(name: "VellutoDomain", targets: ["VellutoDomain"])
    ],
    targets: [
        .target(
            name: "VellutoDomain",
            swiftSettings: [
                .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
                .enableUpcomingFeature("InferIsolatedConformances"),
            ]
        )
    ]
)

// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "VellutoKit",
    platforms: [.iOS(.v26)],
    products: [
        .library(name: "VellutoKit", targets: ["VellutoKit"])
    ],
    targets: [
        .target(
            name: "VellutoKit",
            swiftSettings: [
                .defaultIsolation(MainActor.self),
                .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
                .enableUpcomingFeature("InferIsolatedConformances"),
            ]
        )
    ]
)

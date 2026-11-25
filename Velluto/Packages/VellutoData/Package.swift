// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "VellutoData",
    platforms: [.iOS(.v26)],
    products: [
        .library(name: "VellutoData", targets: ["VellutoData"])
    ],
    dependencies: [
        .package(path: "../VellutoDomain")
    ],
    targets: [
        .target(
            name: "VellutoData",
            dependencies: [
                .product(name: "VellutoDomain", package: "VellutoDomain")
            ],
            swiftSettings: [
                .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
                .enableUpcomingFeature("InferIsolatedConformances"),
            ]
        )
    ]
)

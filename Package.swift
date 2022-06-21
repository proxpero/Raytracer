// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "Raytracer",
    products: [
        .library(
            name: "Raytracer",
            targets: ["Raytracer"]),
    ],
    dependencies: [
    ],
    targets: [
        .executableTarget(
            name: "Projectile",
            dependencies: [
                "Raytracer"
            ]
        ),
        .target(
            name: "Raytracer",
            dependencies: [
            ]
        ),
        .testTarget(
            name: "RaytracerTests",
            dependencies: ["Raytracer"]
        ),
    ]
)

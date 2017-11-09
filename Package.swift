// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "user-service-api",
    products: [
        .library(
            name: "user-service-api",
            targets: ["user-service-api"]),
    ],
    dependencies: [
    	.package(url: "https://github.com/vapor/vapor.git", .upToNextMajor(from: "2.3.0")),
    ],
    targets: [
        .target(
            name: "user-service-api",
            dependencies: ["Vapor"]),
        .testTarget(
            name: "user-service-apiTests",
            dependencies: ["user-service-api"]),
    ]
)

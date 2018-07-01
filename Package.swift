// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MacOSInteractor",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "MacOSInteractor",
            targets: ["MacOSInteractor"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
      .package(url: "../OSInteractor", from: "0.1.0"),
      .package(url: "../Shell", from: "0.1.0"),
      .package(url: "../Cliclick", from: "0.1.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "MacOSInteractor",
            dependencies: ["OSInteractor", "Shell", "Cliclick"]),
        .testTarget(
            name: "MacOSInteractorTests",
            dependencies: ["MacOSInteractor"]),
    ]
)

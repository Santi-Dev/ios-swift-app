// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "iOSSwiftWindowsApp",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "App",
            targets: ["App"]),
    ],
    dependencies: [
        // Aquí puedes añadir dependencias 100% Swift, ej. Alamofire
    ],
    targets: [
        .target(
            name: "App",
            dependencies: []),
        .testTarget(
            name: "AppTests",
            dependencies: ["App"]),
    ]
)

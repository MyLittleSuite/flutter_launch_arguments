// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "flutter_launch_arguments",
    platforms: [.iOS("12.0")],
    products: [
        .library(name: "flutter-launch-arguments", targets: ["flutter_launch_arguments"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework")
    ],
    targets: [
        .target(
            name: "flutter_launch_arguments",
            dependencies: [.product(name: "FlutterFramework", package: "FlutterFramework")],
            resources: [.process("PrivacyInfo.xcprivacy")]
        )
    ]
)

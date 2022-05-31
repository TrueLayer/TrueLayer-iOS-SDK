// swift-tools-version:5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "TrueLayerPaymentsSDK",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "TrueLayerPaymentsSDK",
            targets: ["TrueLayerPaymentsSDK"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "TrueLayerPaymentsSDK",
            url: "https://github.com/TrueLayer/truelayer-ios-sdk/releases/download/1.0.0-beta.5/TrueLayerPaymentsSDK.xcframework.zip",
            checksum: "d2ae77ca0f1830030643192f692bf97133727a343109e7a2b44d137791b48ac0"
        ),
    ]
)

// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "TruelayerPaymentsSdk",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "TruelayerPaymentsSdk",
            targets: ["TruelayerPaymentsSdk"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "TruelayerPaymentsSdk",
            url: "https://github.com/TrueLayer/truelayer-ios-sdk/releases/download/v1.0.0-private-beta/TruelayerPaymentsSdk.xcframework.zip",
            checksum: "1c8d1a2b5708cbdca88575001e571f8e5bc40d78b60931cf3dd9f9ef048e96f7"
        ),
    ]
)

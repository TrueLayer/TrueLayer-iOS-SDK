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
            url: "https://github.com/TrueLayer/truelayer-ios-sdk/releases/download/v1.0.1-private-beta/TruelayerPaymentsSdk.xcframework.zip",
            checksum: "28b0618a00a5b8492a6ea753b55ec840c4f8e38d8c5164a3a0858baf4d3c9105"
        ),
    ]
)

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
            url: "https://github.com/TrueLayer/TrueLayer-iOS-SDK/releases/download/1.0.0-beta.5/TrueLayerPaymentsSDK.xcframework.zip",
            checksum: "14d6c25276f421917ef75e826ac27ef8677fbc7512b1bf13bd1b09469d3777fa"
        ),
    ]
)

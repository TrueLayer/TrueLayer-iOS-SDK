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
            checksum: "327fb58bd3e8c73ebfa60e5de6d21b3a91103ee396ca04997443d2017d0ce5db"
        ),
    ]
)

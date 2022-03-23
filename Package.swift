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
            url: "https://github.com/TrueLayer/TrueLayer-iOS-SDK/releases/download/1.0.0-beta.1/TrueLayerPaymentsSDK.xcframework.zip",
            checksum: "3e68884aed04780a2be06b26d136cb62220ed3034b0a7312fdc0b48fca42af0c"
        ),
    ]
)

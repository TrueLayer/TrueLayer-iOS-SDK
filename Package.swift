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
            url: "https://github.com/TrueLayer/TrueLayer-iOS-SDK/releases/download/1.0.0-beta.4/TrueLayerPaymentsSDK.xcframework.zip",
            checksum: "94f14cff730a4642bd754a030bfdbdbd4eef7e7c7865ec1a603cf872047f5721"
        ),
    ]
)

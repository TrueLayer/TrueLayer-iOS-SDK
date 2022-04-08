// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
  name: "TrueLayerPaymentsSDK",
  platforms: [
    .iOS(.v10)
  ],
  products: [
    .library(
      name: "TrueLayerPaymentsSDK",
      targets: ["TrueLayerPaymentsSDK"]
    ),
  ],
  targets: [
    .binaryTarget(
      name: "TrueLayerPaymentsSDK",
      url: "https://github.com/TrueLayer/truelayer-ios-sdk/releases/download/1.0.0-beta.3/TrueLayerPaymentsSDK.xcframework.zip",
      checksum: "af39101c71b8640d722dd55e8e8e57dd15461280c26d8f2091843315b1a9b9f2"
    ),
  ]
)

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
      url: "https://github.com/TrueLayer/truelayer-ios-sdk/releases/download/1.0.0-beta.2/TrueLayerPaymentsSDK.xcframework.zip",
      checksum: "3399c34a6cad5007f335845e4a2327eb58efa3dd72dbbcd99a29c53ba62667eb"
    ),
  ]
)

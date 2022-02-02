// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
  name: "TruelayerPaymentsSdk",
  products: [
    .library(
      name: "TruelayerPaymentsSdk",
      targets: ["TruelayerPaymentsSdk"]
    ),
  ],
  targets: [
    .binaryTarget(
      name: "TruelayerPaymentsSdk",
      url: "https://github.com/TrueLayer/truelayer-ios-sdk/releases/download/1.0.0-beta.1/TruelayerPayments.xcframework.zip",
      checksum: "f36c31566312d6e3472b26ca13869f69b59aeedac267f91132cddcb5b8e4b419"
    ),
  ]
)

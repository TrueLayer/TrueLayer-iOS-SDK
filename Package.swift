// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "TruelayerPayments",
    products: [
        .library(
            name: "TruelayerPayments",
            targets: ["TruelayerPayments"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "TruelayerPayments",
            url: "https://github.com/TrueLayer/truelayer-ios-sdk/releases/download/0.0.1-pre1/TruelayerPayments.xcframework.zip",
            checksum: "90785c5772ef242221bcc803152e7854fd673817a9033800daf32edeaf83c438"
        ),
    ]
)

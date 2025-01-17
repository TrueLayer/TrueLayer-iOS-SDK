// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TrueLayerSDK",
    platforms: [.iOS("14")],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "TrueLayerSDK",
            targets: [
              "TrueLayerSDK",
              "TrueLayerAPI",
              "TrueLayerCore",
              "TrueLayerUI",
              "TrueLayerMockable",
              "TrueLayerNetwork",
              "TrueLayerLogger",
              "TrueLayerUtils",
              "TrueLayerObjectiveC",
              "TrueLayerArchitecture"
            ]
        ),
    ],
    targets: [
      .binaryTarget(
        name: "TrueLayerSDK",
        path: "Frameworks/TrueLayerSDK.xcframework"
      ),
      .binaryTarget(
        name: "TrueLayerArchitecture",
        path: "Frameworks/TrueLayerArchitecture.xcframework"
      ),
      .binaryTarget(
        name: "TrueLayerUI",
        path: "Frameworks/TrueLayerUI.xcframework"
      ),
      .binaryTarget(
        name: "TrueLayerAPI",
        path: "Frameworks/TrueLayerAPI.xcframework"
      ),
      .binaryTarget(
        name: "TrueLayerMockable",
        path: "Frameworks/TrueLayerMockable.xcframework"
      ),
      .binaryTarget(
        name: "TrueLayerNetwork",
        path: "Frameworks/TrueLayerNetwork.xcframework"
      ),
      .binaryTarget(
        name: "TrueLayerCore",
        path: "Frameworks/TrueLayerCore.xcframework"
      ),
      .binaryTarget(
        name: "TrueLayerLogger",
        path: "Frameworks/TrueLayerLogger.xcframework"
      ),
      .binaryTarget(
        name: "TrueLayerUtils",
        path: "Frameworks/TrueLayerUtils.xcframework"
      ),
      .binaryTarget(
        name: "TrueLayerObjectiveC",
        path: "Frameworks/TrueLayerObjectiveC.xcframework"
      )
    ]
)

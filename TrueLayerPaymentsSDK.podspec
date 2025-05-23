Pod::Spec.new do |s|
  s.name  = "TrueLayerPaymentsSDK"
  s.version = "3.9.1"
  s.summary = "The official iOS SDK for TrueLayer's open banking."
  s.description = "This SDK provides a complete experience to consume TrueLayer's open banking APIs in a fast, safe and optimized manner."
  s.homepage = "https://github.com/TrueLayer/truelayer-ios-sdk"
  s.license = "git@github.com:TrueLayer/truelayer-ios-sdk/licence"
  s.author = "TrueLayer Limited"
  s.source = { :git => "https://github.com/TrueLayer/TrueLayer-iOS-SDK.git", :tag => "#{s.version}" }
  s.platform = :ios
  s.swift_version = "5.10"
  s.ios.deployment_target = "14.0"
  s.vendored_frameworks = "Frameworks/TrueLayerObjectiveC.xcframework", "Frameworks/TrueLayerAPI.xcframework", "Frameworks/TrueLayerCore.xcframework", "Frameworks/TrueLayerLogger.xcframework", "Frameworks/TrueLayerMockable.xcframework", "Frameworks/TrueLayerNetwork.xcframework", "Frameworks/TrueLayerSDK.xcframework", "Frameworks/TrueLayerUI.xcframework", "Frameworks/TrueLayerUtils.xcframework", "Frameworks/TrueLayerArchitecture.xcframework"

  s.pod_target_xcconfig = {
    "DEFINES_MODULE" => "YES",
    "BUILD_LIBRARY_FOR_DISTRIBUTION" => "YES"
  }
end

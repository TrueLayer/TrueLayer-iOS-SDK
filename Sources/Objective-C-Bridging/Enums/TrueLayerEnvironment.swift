import Foundation
import TrueLayerSDK

/// The environment to use when using the TrueLayer SDK.
@objc
public enum TrueLayerEnvironment: Int {
  /// The sandbox environment.
  case sandbox
  
  /// The production environment.
  case production
  
  /// The `SDK` equivalent of the environment.
  var sdkEnvironment: TrueLayer.Environment {
    switch self {
      case .sandbox:
        return .sandbox
        
      case .production:
        return .production
    }
  }
}

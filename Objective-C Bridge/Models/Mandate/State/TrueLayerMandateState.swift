import Foundation
import TrueLayerSDK

/// The different final states in which a mandate can be when successful.
@objc
public enum TrueLayerMandateState: Int {
  /// The user authorized the mandate with the bank.
  case authorized

  /// Then user has been redirected to the bank to authorize the mandate.
  ///
  /// We do not know what happens from there on since we do not have any control over it.
  case redirect
  
  /// Creates an objective-c mandate state from a Swift-only SDK state.
  /// - Parameter sdkState: a Swift-only SDK mandate state.
  init(_ sdkState: TrueLayer.Payments.Models.Mandate.State) {
    switch sdkState {
      case .authorized:
        self = .authorized
      case .redirect:
        self = .redirect
    }
  }
}

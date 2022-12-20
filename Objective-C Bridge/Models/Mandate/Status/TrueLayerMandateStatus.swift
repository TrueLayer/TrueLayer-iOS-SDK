import Foundation
import TrueLayerSDK

@objc
public enum TrueLayerMandateStatus: Int {
  /// The mandate requires authorization.
  /// Pass the same context to the `processMandate(context:then:)` method.
  case authorizationRequired
  
  /// The user is authorizing the mandate.
  ///
  /// If still in this state after the `SDK` dismissed means the user has additional actions to take outside of the application.
  case authorizing
  
  /// The mandate has been authorized by the bank.
  ///
  /// This is a final stage status.
  case authorized
  
  /// The mandate has been revoked and is no longer valid.
  ///
  /// This is a final stage status.
  case revoked
  
  /// The mandate failed. This can be due to various reasons.
  ///
  /// This is a final stage status.
  case failed
  
  /// Creates an objective-c payment state from a Swift-only SDK state.
  /// - Parameter sdkState: a Swift-only SDK payment state.
  init(_ sdkStatus: TrueLayer.Payments.Models.Mandate.Status) {
    switch sdkStatus {
      case .authorizationRequired:
        self = .authorizationRequired
        
      case .authorizing:
        self = .authorizing
        
      case .authorized:
        self = .authorized
        
      case .revoked:
        self = .revoked
        
      case .failed:
        self = .failed
    }
  }
}

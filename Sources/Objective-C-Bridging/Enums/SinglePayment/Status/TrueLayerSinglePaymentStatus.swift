import Foundation
import TrueLayerSDK

@objc
public enum TrueLayerSinglePaymentStatus: Int {
  /// The payment requires authorisation.
  /// Pass the same context to the `processPayment(context:then:)` method.
  case authorizationRequired

  /// The user is authorizing the payment.
  ///
  /// If still in this state after the `SDK` dismissed means the user has additional actions to take outside of the application.
  case authorizing

  /// The payment has been authorized by the bank.
  ///
  /// This is a final stage status.
  case authorized

  /// The payment has been executed.
  ///
  /// This is a final stage status.
  case executed

  /// The funds reached their final destination.
  ///
  /// This is a final stage status.
  case settled

  /// The payment failed. This can be due to various reasons.
  ///
  /// This is a final stage status.
  case failed
  
  /// Creates an objective-c payment state from a Swift-only SDK state.
  /// - Parameter sdkState: a Swift-only SDK payment state.
  init(_ sdkStatus: TrueLayer.Payments.Models.SinglePayment.Status) {
    switch sdkStatus {
      case .authorizationRequired:
        self = .authorizationRequired
        
      case .authorizing:
        self = .authorizing
        
      case .authorized:
        self = .authorized
        
      case .executed:
        self = .executed
        
      case .settled:
        self = .settled
        
      case .failed:
        self = .failed
        
      @unknown default:
        fatalError("Status not supported")
    }
  }
}

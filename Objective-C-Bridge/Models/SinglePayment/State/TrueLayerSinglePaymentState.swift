import Foundation
import TrueLayerSDK

/// The different final states in which a payment can be when successful.
@objc
public enum TrueLayerSinglePaymentState: Int {
  /// The user authorized the payment with the bank.
  case authorized
  
  /// The bank confirmed the payment.
  case executed
  
  /// Then user has been redirected to the bank to authorize the payment.
  ///
  /// We do not know what happens from there on since we do not have any control over it.
  case redirect
  
  /// The funds have reached the destination.
  case settled
  
  /// The user did everything needed to do, but the merchant has to wait for the output.
  case wait
  
  /// Creates an objective-c payment state from a Swift-only SDK state.
  /// - Parameter sdkState: a Swift-only SDK payment state.
  init(_ sdkState: TrueLayer.Payments.Models.SinglePayment.State) {
    switch sdkState {
      case .authorized:
        self = .authorized
      case .executed:
        self = .executed
      case .redirect:
        self = .redirect
      case .settled:
        self = .settled
      case .wait:
        self = .wait
    }
  }
}

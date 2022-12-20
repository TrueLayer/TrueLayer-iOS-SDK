import Foundation
import TrueLayerSDK

/// The different errors which can occur while processing a single payment.
@objc
public enum TrueLayerSinglePaymentError: Int, Error {
  /// The authorization process failed on the user <-> bank side.
  case authorizationFailed

  /// There was an issue while connecting to the internet.
  /// Either the user is offline, or the request timed out.
  case connectionIssues

  /// A unexpected error, the error will be passed as a `String` parameter.
  case generic

  /// The token used to make the payment is not authorized to undergo such operation.
  case invalidToken

  /// The user took too long to complete the payment, and therefore it expired.
  case paymentExpired

  /// The requested payment was not found.
  /// This is probably due to it not being created on the backend side.
  case paymentNotFound

  /// The payment was rejected by the bank.
  case paymentRejected

  /// The `SDK` `configure` method has not been called before using it.
  case sdkNotConfigured

  /// The server encountered an error while processing the answer.
  case serverError

  /// The `SDK` encountered an unexpected behavior.
  ///
  /// This error should never occur.
  case unexpectedBehavior

  /// The user canceled the payment.
  case userCanceled
  
  /// Creates an Objective-C payment state from a Swift-only SDK state.
  /// - Parameter sdkState: a Swift-only SDK payment state.
  init(_ sdkError: TrueLayer.Payments.Models.SinglePayment.Error) {
    switch sdkError {
      case .authorizationFailed:
        self = .authorizationFailed
        
      case .connectionIssues:
        self = .connectionIssues
        
      case .generic:
        self = .generic
        
      case .invalidToken:
        self = .invalidToken
        
      case .paymentExpired:
        self = .paymentExpired
        
      case .paymentNotFound:
        self = .paymentNotFound
        
      case .paymentRejected:
        self = .paymentRejected
        
      case .sdkNotConfigured:
        self = .sdkNotConfigured
        
      case .serverError:
        self = .serverError
        
      case .unexpectedBehavior:
        self = .unexpectedBehavior
        
      case .userCanceled:
        self = .userCanceled

      @unknown default:
        self = .unexpectedBehavior
    }
  }
}

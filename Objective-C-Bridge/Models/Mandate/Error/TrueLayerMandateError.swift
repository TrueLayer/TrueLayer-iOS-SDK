import Foundation
import TrueLayerSDK

/// The list of possible errors that can happen inside of `TrueLayer`'s SDK when processing a mandate.
@objc
public enum TrueLayerMandateError: Int, Error {
  /// The authorization process failed on the user <-> bank side.
  case authorizationFailed

  /// There was an issue while connecting to the internet.
  /// Either the user is offline, or the request timed out.
  case connectionIssues

  /// A unexpected error, the error will be passed as a `String` parameter.
  case generic

  /// The token used to make the mandate is not authorized to undergo such operation.
  case invalidToken

  /// The mandate expired.
  case mandateExpired

  /// The requested mandate was not found.
  /// This is probably due to it not being created on the backend side.
  case mandateNotFound

  /// The mandate was rejected by the bank.
  case mandateRejected

  /// The mandate has been revoked and is no longer valid.
  case revoked

  /// The SDK `configure` method has not been called before using it.
  case sdkNotConfigured

  /// The server encountered an error while processing the answer.
  case serverError

  /// The SDK encountered an unexpected behaviour.
  ///
  /// This error should never occur.
  case unexpectedBehavior

  /// The user canceled the mandate.
  case userCanceled
  
  /// Creates an Objective-C mandate error from a Swift-only SDK error.
  /// - Parameter sdkState: a Swift-only SDK error.
  init(_ sdkError: TrueLayer.Payments.Models.Mandate.Error) {
    switch sdkError {
      case .authorizationFailed:
        self = .authorizationFailed
        
      case .connectionIssues:
        self = .connectionIssues
        
      case .generic:
        self = .generic
        
      case .invalidToken:
        self = .invalidToken
        
      case .mandateExpired:
        self = .mandateExpired
        
      case .mandateNotFound:
        self = .mandateNotFound
        
      case .mandateRejected:
        self = .mandateRejected
        
      case .revoked:
        self = .revoked
        
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

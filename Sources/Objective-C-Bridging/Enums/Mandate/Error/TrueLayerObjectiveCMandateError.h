#ifndef TrueLayerObjectiveCMandateError_h
#define TrueLayerObjectiveCMandateError_h

/// The different final states in which a payment can be when successful.
typedef NS_CLOSED_ENUM(NSInteger, TrueLayerObjectiveCMandateError) {
  /// The authorization process failed on the user <-> bank side.
  TrueLayerMandateErrorAuthorizationFailed = 0,
  
  /// There was an issue while connecting to the internet.
  /// Either the user is offline, or the request timed out.
  TrueLayerMandateErrorConnectionIssues = 1,
  
  /// A unexpected error, the error will be passed as a `String` parameter.
  TrueLayerMandateErrorGeneric = 2,
  
  /// The token used to make the mandate is not authorized to undergo such operation.
  TrueLayerMandateErrorInvalidToken = 3,
  
  /// The mandate expired.
  TrueLayerMandateErrorMandateExpired = 4,
  
  /// The requested mandate was not found.
  /// This is probably due to it not being created on the backend side.
  TrueLayerMandateErrorMandateNotFound = 5,
  
  /// The mandate was rejected by the bank.
  TrueLayerMandateErrorMandateRejected = 6,
  
  /// The mandate has been revoked and is no longer valid.
  TrueLayerMandateErrorRevoked = 7,
  
  /// The SDK `configure` method has not been called before using it.
  TrueLayerMandateErrorSdkNotConfigured = 8,
  
  /// The server encountered an error while processing the answer.
  TrueLayerMandateErrorServerError = 9,
  
  /// The SDK encountered an unexpected behavior.
  /// This error should never occur.
  TrueLayerMandateErrorUnexpectedBehavior = 10,
  
  /// The user canceled the mandate.
  TrueLayerMandateErrorUserCanceled = 11,
};

#endif /* TrueLayerObjectiveCMandateError_h */

#ifndef TrueLayerMandateError_h
#define TrueLayerMandateError_h

/// The different final states in which a payment can be when successful.
typedef NS_CLOSED_ENUM(NSInteger, TrueLayerMandateError) {
  /// The authorization process failed on the user <-> bank side.
  TrueLayerMandateAuthorizationFailed = 0,
  /// There was an issue while connecting to the internet.
  /// Either the user is offline, or the request timed out.
  TrueLayerMandateConnectionIssues = 1,
  /// A unexpected error, the error will be passed as a <code>String</code> parameter.
  TrueLayerMandateGeneric = 2,
  /// The token used to make the mandate is not authorized to undergo such operation.
  TrueLayerMandateInvalidToken = 3,
  /// The mandate expired.
  TrueLayerMandateMandateExpired = 4,
  /// The requested mandate was not found.
  /// This is probably due to it not being created on the backend side.
  TrueLayerMandateMandateNotFound = 5,
  /// The mandate was rejected by the bank.
  TrueLayerMandateMandateRejected = 6,
  /// The mandate has been revoked and is no longer valid.
  TrueLayerMandateRevoked = 7,
  /// The SDK <code>configure</code> method has not been called before using it.
  TrueLayerMandateSdkNotConfigured = 8,
  /// The server encountered an error while processing the answer.
  TrueLayerMandateServerError = 9,
  /// The SDK encountered an unexpected behaviour.
  /// This error should never occur.
  TrueLayerMandateUnexpectedBehavior = 10,
  /// The user canceled the mandate.
  TrueLayerMandateUserCanceled = 11,
};

#endif /* TrueLayerMandateError_h */

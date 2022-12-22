#ifndef TrueLayerMandateObjCError_h
#define TrueLayerMandateObjCError_h

/// The different final states in which a payment can be when successful.
typedef NS_CLOSED_ENUM(NSInteger, TrueLayerMandateObjCError) {
  /// The authorization process failed on the user <-> bank side.
  TrueLayerMandateObjCErrorAuthorizationFailed = 0,
  /// There was an issue while connecting to the internet.
  /// Either the user is offline, or the request timed out.
  TrueLayerMandateObjCErrorConnectionIssues = 1,
  /// A unexpected error, the error will be passed as a <code>String</code> parameter.
  TrueLayerMandateObjCErrorGeneric = 2,
  /// The token used to make the mandate is not authorized to undergo such operation.
  TrueLayerMandateObjCErrorInvalidToken = 3,
  /// The mandate expired.
  TrueLayerMandateObjCErrorMandateExpired = 4,
  /// The requested mandate was not found.
  /// This is probably due to it not being created on the backend side.
  TrueLayerMandateObjCErrorMandateNotFound = 5,
  /// The mandate was rejected by the bank.
  TrueLayerMandateObjCErrorMandateRejected = 6,
  /// The mandate has been revoked and is no longer valid.
  TrueLayerMandateObjCErrorRevoked = 7,
  /// The SDK <code>configure</code> method has not been called before using it.
  TrueLayerMandateObjCErrorSdkNotConfigured = 8,
  /// The server encountered an error while processing the answer.
  TrueLayerMandateObjCErrorServerError = 9,
  /// The SDK encountered an unexpected behaviour.
  /// This error should never occur.
  TrueLayerMandateObjCErrorUnexpectedBehavior = 10,
  /// The user canceled the mandate.
  TrueLayerMandateObjCErrorUserCanceled = 11,
};

#endif /* TrueLayerMandateObjCError_h */

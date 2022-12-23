#ifndef TrueLayerSinglePaymentError_h
#define TrueLayerSinglePaymentError_h

/// The different errors that can occur when processing a single payment.
typedef NS_CLOSED_ENUM(NSInteger, TrueLayerSinglePaymentError) {
  /// The authorization process failed on the user <-> bank side.
  TrueLayerSinglePaymentAuthorizationFailed = 0,
  /// There was an issue while connecting to the internet.
  /// Either the user is offline, or the request timed out.
  TrueLayerSinglePaymentConnectionIssues = 1,
  /// A unexpected error, the error will be passed as a `String` parameter.
  TrueLayerSinglePaymentGeneric = 2,
  /// The token used to make the payment is not authorized to undergo such operation.
  TrueLayerSinglePaymentInvalidToken = 3,
  /// The user took too long to complete the payment, and therefore it expired.
  TrueLayerSinglePaymentPaymentExpired = 4,
  /// The requested payment was not found.
  /// This is probably due to it not being created on the backend side.
  TrueLayerSinglePaymentPaymentNotFound = 5,
  /// The payment was rejected by the bank.
  TrueLayerSinglePaymentPaymentRejected = 6,
  /// The `SDK` `configure` method has not been called before using it.
  TrueLayerSinglePaymentSdkNotConfigured = 7,
  /// The server encountered an error while processing the answer.
  TrueLayerSinglePaymentServerError = 8,
  /// The `SDK` encountered an unexpected behavior.
  ///
  /// This error should never occur.
  TrueLayerSinglePaymentUnexpectedBehavior = 9,
  /// The user canceled the payment.
  TrueLayerSinglePaymentUserCanceled = 10,
};

#endif /* TrueLayerSinglePaymentError_h */

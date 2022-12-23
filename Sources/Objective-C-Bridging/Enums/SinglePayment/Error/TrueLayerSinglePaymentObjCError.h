#ifndef TrueLayerSinglePaymentObjCError_h
#define TrueLayerSinglePaymentObjCError_h

/// The different errors that can occur when processing a single payment.
typedef NS_CLOSED_ENUM(NSInteger, TrueLayerSinglePaymentObjCError) {
  /// The authorization process failed on the user <-> bank side.
  TrueLayerSinglePaymentObjCErrorAuthorizationFailed = 0,
  /// There was an issue while connecting to the internet.
  /// Either the user is offline, or the request timed out.
  TrueLayerSinglePaymentObjCErrorConnectionIssues = 1,
  /// A unexpected error, the error will be passed as a `String` parameter.
  TrueLayerSinglePaymentObjCErrorGeneric = 2,
  /// The token used to make the payment is not authorized to undergo such operation.
  TrueLayerSinglePaymentObjCErrorInvalidToken = 3,
  /// The user took too long to complete the payment, and therefore it expired.
  TrueLayerSinglePaymentObjCErrorPaymentExpired = 4,
  /// The requested payment was not found.
  /// This is probably due to it not being created on the backend side.
  TrueLayerSinglePaymentObjCErrorPaymentNotFound = 5,
  /// The payment was rejected by the bank.
  TrueLayerSinglePaymentObjCErrorPaymentRejected = 6,
  /// The `SDK` `configure` method has not been called before using it.
  TrueLayerSinglePaymentObjCErrorSdkNotConfigured = 7,
  /// The server encountered an error while processing the answer.
  TrueLayerSinglePaymentObjCErrorServerError = 8,
  /// The `SDK` encountered an unexpected behavior.
  ///
  /// This error should never occur.
  TrueLayerSinglePaymentObjCErrorUnexpectedBehavior = 9,
  /// The user canceled the payment.
  TrueLayerSinglePaymentObjCErrorUserCanceled = 10,
};

#endif /* TrueLayerSinglePaymentObjCError_h */

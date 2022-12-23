#ifndef TrueLayerObjectiveCSinglePaymentError_h
#define TrueLayerObjectiveCSinglePaymentError_h

/// The different errors that can occur when processing a single payment.
typedef NS_CLOSED_ENUM(NSInteger, TrueLayerObjectiveCSinglePaymentError) {
  /// The authorization process failed on the user <-> bank side.
  TrueLayerSinglePaymentErrorAuthorizationFailed = 0,
  
  /// There was an issue while connecting to the internet.
  /// Either the user is offline, or the request timed out.
  TrueLayerSinglePaymentErrorConnectionIssues = 1,
  
  /// A unexpected error, the error will be passed as a `String` parameter.
  TrueLayerSinglePaymentErrorGeneric = 2,
  
  /// The token used to make the payment is not authorized to undergo such operation.
  TrueLayerSinglePaymentErrorInvalidToken = 3,
  
  /// The user took too long to complete the payment, and therefore it expired.
  TrueLayerSinglePaymentErrorPaymentExpired = 4,
  
  /// The requested payment was not found.
  /// This is probably due to it not being created on the backend side.
  TrueLayerSinglePaymentErrorPaymentNotFound = 5,
  
  /// The payment was rejected by the bank.
  TrueLayerSinglePaymentErrorPaymentRejected = 6,
  
  /// The `SDK` `configure` method has not been called before using it.
  TrueLayerSinglePaymentErrorSdkNotConfigured = 7,
  
  /// The server encountered an error while processing the answer.
  TrueLayerSinglePaymentErrorServerError = 8,
  
  /// The `SDK` encountered an unexpected behavior.
  ///
  /// This error should never occur.
  TrueLayerSinglePaymentErrorUnexpectedBehavior = 9,
  
  /// The user canceled the payment.
  TrueLayerSinglePaymentErrorUserCanceled = 10,
};

#endif /* TrueLayerObjectiveCSinglePaymentError_h */

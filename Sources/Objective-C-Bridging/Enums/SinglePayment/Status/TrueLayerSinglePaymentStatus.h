#ifndef TrueLayerSinglePaymentStatus_h
#define TrueLayerSinglePaymentStatus_h

/// The various statuses in which a payment can be.
typedef NS_CLOSED_ENUM(NSInteger, TrueLayerSinglePaymentStatus) {
  /// The payment requires authorisation.
  /// Pass the same context to the `processPayment(context:then:)` method.
  TrueLayerSinglePaymentStatusAuthorizationRequired = 0,

  /// The user is authorizing the payment.
  /// If still in this state after the `SDK` dismissed means the user has additional actions to take outside of the application.
  TrueLayerSinglePaymentStatusAuthorizing = 1,

  /// The payment has been authorized by the bank.
  /// This is a final stage status.
  TrueLayerSinglePaymentStatusAuthorized = 2,

  /// The payment has been executed.
  /// This is a final stage status.
  TrueLayerSinglePaymentStatusExecuted = 3,

  /// The funds reached their final destination.
  /// This is a final stage status.
  TrueLayerSinglePaymentStatusSettled = 4,

  /// The payment failed. This can be due to various reasons.
  /// This is a final stage status.
  TrueLayerSinglePaymentStatusFailed = 5,
};

#endif /* TrueLayerSinglePaymentStatus_h */

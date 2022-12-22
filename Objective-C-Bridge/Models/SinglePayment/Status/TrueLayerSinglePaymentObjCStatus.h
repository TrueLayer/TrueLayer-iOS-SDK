#ifndef TrueLayerSinglePaymentObjCStatus_h
#define TrueLayerSinglePaymentObjCStatus_h

/// The various statuses in which a payment can be.
typedef NS_CLOSED_ENUM(NSInteger, TrueLayerSinglePaymentObjCStatus) {
  /// The payment requires authorisation.
  /// Pass the same context to the <code>processPayment(context:then:)</code> method.
  TrueLayerSinglePaymentObjCStatusAuthorizationRequired = 0,

  /// The user is authorizing the payment.
  /// If still in this state after the <code>SDK</code> dismissed means the user has additional actions to take outside of the application.
  TrueLayerSinglePaymentObjCStatusAuthorizing = 1,

  /// The payment has been authorized by the bank.
  /// This is a final stage status.
  TrueLayerSinglePaymentObjCStatusAuthorized = 2,

  /// The payment has been executed.
  /// This is a final stage status.
  TrueLayerSinglePaymentObjCStatusExecuted = 3,

  /// The funds reached their final destination.
  /// This is a final stage status.
  TrueLayerSinglePaymentObjCStatusSettled = 4,

  /// The payment failed. This can be due to various reasons.
  /// This is a final stage status.
  TrueLayerSinglePaymentObjCStatusFailed = 5,
};

#endif /* TrueLayerSinglePaymentObjCStatus_h */

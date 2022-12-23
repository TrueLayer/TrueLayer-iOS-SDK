#ifndef TrueLayerSinglePaymentState_h
#define TrueLayerSinglePaymentState_h

/// The different final states in which a payment can be when successful.
typedef NS_CLOSED_ENUM(NSInteger, TrueLayerSinglePaymentState) {
/// The user authorized the payment with the bank.
  TrueLayerSinglePaymentAuthorized = 0,
/// The bank confirmed the payment.
  TrueLayerSinglePaymentExecuted = 1,
/// Then user has been redirected to the bank to authorize the payment.
/// We do not know what happens from there on since we do not have any control over it.
  TrueLayerSinglePaymentRedirect = 2,
/// The funds have reached the destination.
  TrueLayerSinglePaymentSettled = 3,
/// The user did everything needed to do, but the merchant has to wait for the output.
  TrueLayerSinglePaymentWait = 4,
};

#endif /* TrueLayerSinglePaymentState_h */

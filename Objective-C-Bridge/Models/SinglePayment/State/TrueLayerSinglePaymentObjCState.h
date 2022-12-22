#ifndef TrueLayerSinglePaymentObjCState_h
#define TrueLayerSinglePaymentObjCState_h

/// The different final states in which a payment can be when successful.
typedef NS_CLOSED_ENUM(NSInteger, TrueLayerSinglePaymentObjCState) {
/// The user authorized the payment with the bank.
  TrueLayerSinglePaymentObjCStateAuthorized = 0,
/// The bank confirmed the payment.
  TrueLayerSinglePaymentObjCStateExecuted = 1,
/// Then user has been redirected to the bank to authorize the payment.
/// We do not know what happens from there on since we do not have any control over it.
  TrueLayerSinglePaymentObjCStateRedirect = 2,
/// The funds have reached the destination.
  TrueLayerSinglePaymentObjCStateSettled = 3,
/// The user did everything needed to do, but the merchant has to wait for the output.
  TrueLayerSinglePaymentObjCStateWait = 4,
};

#endif /* TrueLayerSinglePaymentObjCState_h */

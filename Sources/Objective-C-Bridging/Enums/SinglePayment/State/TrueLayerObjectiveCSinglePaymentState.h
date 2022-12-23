#ifndef TrueLayerObjectiveCSinglePaymentState_h
#define TrueLayerObjectiveCSinglePaymentState_h

/// The different final states in which a payment can be when successful.
typedef NS_CLOSED_ENUM(NSInteger, TrueLayerObjectiveCSinglePaymentState) {
/// The user authorized the payment with the bank.
  TrueLayerSinglePaymentStateAuthorized = 0,
  
/// The bank confirmed the payment.
  TrueLayerSinglePaymentStateExecuted = 1,
  
/// Then user has been redirected to the bank to authorize the payment.
/// We do not know what happens from there on since we do not have any control over it.
  TrueLayerSinglePaymentStateRedirect = 2,
  
/// The funds have reached the destination.
  TrueLayerSinglePaymentStateSettled = 3,
  
/// The user did everything needed to do, but the merchant has to wait for the output.
  TrueLayerSinglePaymentStateWait = 4,
};

#endif /* TrueLayerSingleObjectiveCPaymentState_h */

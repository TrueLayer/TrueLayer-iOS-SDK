#ifndef TrueLayerSinglePaymentObjCError_h
#define TrueLayerSinglePaymentObjCError_h

/// The different final states in which a payment can be when successful.
typedef NS_CLOSED_ENUM(NSInteger, TrueLayerSinglePaymentObjCError) {
  TrueLayerSinglePaymentObjCErrorAuthorizationFailed = 0,
  TrueLayerSinglePaymentObjCErrorConnectionIssues = 1,
  TrueLayerSinglePaymentObjCErrorGeneric = 2,
  TrueLayerSinglePaymentObjCErrorInvalidToken = 3,
  TrueLayerSinglePaymentObjCErrorPaymentExpired = 4,
  TrueLayerSinglePaymentObjCErrorPaymentNotFound = 5,
  TrueLayerSinglePaymentObjCErrorPaymentRejected = 6,
  TrueLayerSinglePaymentObjCErrorSdkNotConfigured = 7,
  TrueLayerSinglePaymentObjCErrorServerError = 8,
  TrueLayerSinglePaymentObjCErrorUnexpectedBehavior = 9,
  TrueLayerSinglePaymentObjCErrorUserCanceled = 10,
};

#endif /* TrueLayerSinglePaymentObjCError_h */

#ifndef TrueLayerSinglePaymentObjCError_h
#define TrueLayerSinglePaymentObjCError_h

/// The different errors that can occur when processing a single payment.
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

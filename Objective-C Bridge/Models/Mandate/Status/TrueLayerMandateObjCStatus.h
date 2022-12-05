#ifndef TrueLayerMandateObjCStatus_h
#define TrueLayerMandateObjCStatus_h

/// The various statuses in which a payment can be.
typedef NS_CLOSED_ENUM(NSInteger, TrueLayerMandateObjCStatus) {
  /// The mandate requires authorization.
  /// Pass the same context to the `processMandate(context:then:)` method.
  TrueLayerMandateObjCStatusAuthorizationRequired = 0,
  /// The user is authorizing the mandate.
  /// If still in this state after the SDK dismissed means the user has additional actions to take outside of the application.
  TrueLayerMandateObjCStatusAuthorizing = 1,
  /// The mandate has been authorized by the bank.
  /// This is a final stage status.
  TrueLayerMandateObjCStatusAuthorized = 2,
  /// The mandate has been revoked and is no longer valid.
  /// This is a final stage status.
  TrueLayerMandateObjCStatusRevoked = 3,
  /// The mandate failed. This can be due to various reasons.
  /// This is a final stage status.
  TrueLayerMandateObjCStatusFailed = 4,
};

#endif /* TrueLayerMandateObjCStatus_h */

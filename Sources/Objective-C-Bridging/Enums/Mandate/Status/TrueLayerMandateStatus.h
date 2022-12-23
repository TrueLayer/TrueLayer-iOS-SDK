#ifndef TrueLayerMandateStatus_h
#define TrueLayerMandateStatus_h

/// The various statuses in which a payment can be.
typedef NS_CLOSED_ENUM(NSInteger, TrueLayerMandateStatus) {
  /// The mandate requires authorization.
  /// Pass the same context to the `processMandate(context:then:)` method.
  TrueLayerMandateStatusAuthorizationRequired = 0,

  /// The user is authorizing the mandate.
  /// If still in this state after the SDK dismissed means the user has additional actions to take outside of the application.
  TrueLayerMandateStatusAuthorizing = 1,

  /// The mandate has been authorized by the bank.
  /// This is a final stage status.
  TrueLayerMandateStatusAuthorized = 2,

  /// The mandate has been revoked and is no longer valid.
  /// This is a final stage status.
  TrueLayerMandateStatusRevoked = 3,

  /// The mandate failed. This can be due to various reasons.
  /// This is a final stage status.
  TrueLayerMandateStatusFailed = 4,
};

#endif /* TrueLayerMandateStatus_h */

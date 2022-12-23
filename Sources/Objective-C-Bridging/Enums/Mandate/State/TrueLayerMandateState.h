#ifndef TrueLayerMandateState_h
#define TrueLayerMandateState_h

/// The different final states in which a mandate can be when successful.
typedef NS_CLOSED_ENUM(NSInteger, TrueLayerMandateState) {
  /// The user authorized the mandate with the bank.
  TrueLayerMandateAuthorized = 0,
  /// Then user has been redirected to the bank to authorize the mandate.
  ///
  /// We do not know what happens from there on since we do not have any control over it.
  TrueLayerMandateRedirect = 1,
};

#endif /* TrueLayerMandateState_h */

#ifndef TrueLayerObjectiveCMandateState_h
#define TrueLayerObjectiveCMandateState_h

/// The different final states in which a mandate can be when successful.
typedef NS_CLOSED_ENUM(NSInteger, TrueLayerObjectiveCMandateState) {
  /// The user authorized the mandate with the bank.
  TrueLayerMandateStateAuthorized = 0,
  /// Then user has been redirected to the bank to authorize the mandate.
  ///
  /// We do not know what happens from there on since we do not have any control over it.
  TrueLayerMandateStateRedirect = 1,
};

#endif /* TrueLayerObjectiveCMandateState_h */

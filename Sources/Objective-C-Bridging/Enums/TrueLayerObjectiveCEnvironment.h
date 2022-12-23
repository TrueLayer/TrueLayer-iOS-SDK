#ifndef TrueLayerObjectiveCEnvironment_h
#define TrueLayerObjectiveCEnvironment_h

/// The different final states in which a payment can be when successful.
typedef NS_CLOSED_ENUM(NSInteger, TrueLayerObjectiveCEnvironment) {
  /// The sandbox environment.
  TrueLayerObjectiveCEnvironmentSandbox = 0,
  /// The production environment.
  TrueLayerObjectiveCEnvironmentProduction = 1,
};

#endif /* TrueLayerEnvironment_h */

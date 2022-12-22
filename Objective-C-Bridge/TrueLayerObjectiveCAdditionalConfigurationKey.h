#ifndef TrueLayerObjectiveCAdditionalConfigurationKey_h
#define TrueLayerObjectiveCAdditionalConfigurationKey_h

@interface TrueLayerObjectiveCAdditionalConfigurationKey: NSObject
/// The type of integration with the TrueLayer SDK, e.g. native or React Native.
+(NSString *)integrationType;

/// The version of the integration, if necessary.
///
/// This should be included if the `integrationType` is not native.
+(NSString *)integrationVersion;

@end

#endif /* TrueLayerObjectiveCAdditionalConfigurationKey_h */

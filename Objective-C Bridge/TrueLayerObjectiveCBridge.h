#ifndef Header_h
#define Header_h

#import "TrueLayerObjectiveCEnvironment.h"
#import "TrueLayerSinglePaymentContext.h"
#import "TrueLayerSinglePaymentObjCState.h"
#import "TrueLayerSinglePaymentObjCError.h"

/// A native bridging class to use the `TrueLayerSDK.TrueLayer.Payments.Manager` in Objective-C projects.
@interface TrueLayerObjectiveCBridge: NSObject
/// Configures and sets up the SDK for a given environment.
/// - Parameters:
///   - environment: The environment to set up the SDK with.
///   - error: An error that occurs during configuration, for example if the environment is not valid.
+(void)configureWith:(TrueLayerObjectiveCEnvironment)environment;

@end

#endif /* Header_h */

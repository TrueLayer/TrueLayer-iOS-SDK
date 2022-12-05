#ifndef Header_h
#define Header_h

#import "TrueLayerObjectiveCEnvironment.h"
#import "TrueLayerSinglePaymentContext.h"
#import "TrueLayerSinglePaymentObjCState.h"
#import "TrueLayerSinglePaymentObjCError.h"
#import "TrueLayerMandateContext.h"
#import "TrueLayerMandateObjCState.h"
#import "TrueLayerMandateObjCError.h"

/// A native bridging class to use the `TrueLayerSDK.TrueLayer.Payments.Manager` in Objective-C projects.
@interface TrueLayerObjectiveCBridge: NSObject
/// Configures and sets up the SDK for a given environment.
/// - Parameters:
///   - environment: The environment to set up the SDK with.
///   - error: An error that occurs during configuration, for example if the environment is not valid.
+(void)configureWith:(TrueLayerObjectiveCEnvironment)environment;

/// Presents the SDK in the app to carry out a payment.
///
/// This method can be called multiple times to process different payments.
/// Before using this method, make sure that the SDK has been started, otherwise it will raise an error.
/// - Parameters:
///   - context: an object that contains all the information required for the payment and to customise how the SDK behaves.
///   - success: A closure called when the payment authorisation flow has been successful within the scope of the SDK. A enum is passed with the state of the payment.
///   - failure: A closure called when the payment authorization flow has failed within the scope of the SDK, passing a given error.
+(void)processSinglePaymentWithContext:(TrueLayerSinglePaymentContext * _Nonnull)context
                                success:(void (^ _Nonnull)(enum TrueLayerSinglePaymentObjCState))success
                                failure:(void (^ _Nonnull)(enum TrueLayerSinglePaymentObjCError))failure;


/// It presents the SDK in the app to process a mandate/Variable Recurring Payment.
///
/// This method can be called multiple times to process different mandates.
/// Before using this method, make sure that the SDK has been started, otherwise it will raise an error.
/// - Parameters:
///   - context: an object that contains all the information required for the mandate and to customise how the SDK behaves.
///   - success: A closure called when the mandate authorisation flow has been successful within the scope of the SDK. A enum is passed with the state of the mandate.
///   - failure: A closure called when the payment authorization flow has failed within the scope of the SDK, passing a given error.
+(void)processMandateWithContext:(TrueLayerMandateContext * _Nonnull)context
                         success:(void (^ _Nonnull)(enum TrueLayerMandateObjCState))success
                         failure:(void (^ _Nonnull)(enum TrueLayerMandateObjCError))failure;

@end

#endif /* Header_h */

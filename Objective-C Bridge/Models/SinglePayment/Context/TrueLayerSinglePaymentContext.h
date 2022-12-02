#ifndef TrueLayerPaymentContext_h
#define TrueLayerPaymentContext_h

#import "TrueLayerSinglePaymentPreferences.h"

@interface TrueLayerSinglePaymentContext: NSObject
/// The identifier of the single payment to process.
@property (nonatomic, readwrite, copy) NSString * _Nonnull paymentID;

/// The security token associated with the payment.
@property (nonatomic, readwrite, copy) NSString * _Nonnull resourceToken;

/// The destination where the user should be redirected once the authorization flow is done outside of the app (bank website, HPP).
@property (nonatomic, readwrite, copy) NSURL * _Nonnull redirectURL;

/// The UIViewController to present the SDK on.
@property (nonatomic, readwrite, strong) TrueLayerSinglePaymentPreferences * _Nonnull preferences;

/// Initializes a new `TrueLayerSinglePaymentContext` object.
/// - Parameters:
///   - paymentID: The identifier of the single payment to process.
///   - resourceToken: The security token associated with the payment.
///   - redirectURL: The destination where the user should be redirected once the authorization flow is done outside of the app (bank website, HPP).
///   - viewController: The UIViewController to present the SDK on.
- (nonnull instancetype)initWithPaymentID:(NSString * _Nonnull)paymentID
                            resourceToken:(NSString * _Nonnull)resourceToken
                              redirectURL:(NSURL * _Nonnull)redirectURL
                           preferences:(TrueLayerSinglePaymentPreferences * _Nonnull)preferences;
@end

#endif /* TrueLayerPaymentContext_h */

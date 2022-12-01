#ifndef TrueLayerMandateContext_h
#define TrueLayerMandateContext_h

@interface TrueLayerMandateContext: NSObject
/// The identifier of the mandate to process.
@property (nonatomic, readwrite, copy) NSString * _Nonnull mandateID;

/// The security token associated with the mandate.
@property (nonatomic, readwrite, copy) NSString * _Nonnull resourceToken;

/// The destination where the user should be redirected once the authorization flow is done outside of the app (bank website, HPP).
@property (nonatomic, readwrite, copy) NSURL * _Nonnull redirectURL;

/// The UIViewController to present the SDK on.
@property (nonatomic, readwrite, strong) UIViewController * _Nonnull viewController;

/// Initializes a new `TrueLayerMandateContext` object.
/// - Parameters:
///   - mandateID: The identifier of the mandate to process.
///   - resourceToken: The security token associated with the mandate.
///   - redirectURL: The destination where the user should be redirected once the authorization flow is done outside of the app (bank website, HPP).
///   - viewController: The UIViewController to present the SDK on.
- (nonnull instancetype)initWithMandateID:(NSString * _Nonnull)mandateID
                            resourceToken:(NSString * _Nonnull)resourceToken
                              redirectURL:(NSURL * _Nonnull)redirectURL
                           viewController:(UIViewController * _Nonnull)viewController;
@end

#endif /* TrueLayerMandateContext_h */

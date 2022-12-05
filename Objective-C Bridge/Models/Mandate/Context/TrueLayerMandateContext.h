#ifndef TrueLayerMandateContext_h
#define TrueLayerMandateContext_h

#import "TrueLayerMandatePreferences.h"

@interface TrueLayerMandateContext: NSObject
/// The identifier of the mandate to process.
@property (nonatomic, readwrite, copy) NSString * _Nonnull identifier;

/// The security token associated with the mandate.
@property (nonatomic, readwrite, copy) NSString * _Nonnull resourceToken;

/// The destination where the user should be redirected once the authorization flow is done outside of the app (bank website, HPP).
@property (nonatomic, readwrite, copy) NSURL * _Nonnull redirectURL;

/// The preferences to apply to the mandate.
@property (nonatomic, readwrite, strong) TrueLayerMandatePreferences * _Nonnull preferences;

/// Initializes a new `TrueLayerMandateContext` object.
/// - Parameters:
///   - identifier: The identifier of the mandate to process.
///   - resourceToken: The security token associated with the mandate.
///   - redirectURL: The destination where the user should be redirected once the authorization flow is done outside of the app (bank website, HPP).
///   - preferences: The preferences to apply to the mandate.
- (nonnull instancetype)initWithIdentifier:(NSString * _Nonnull)identifier
                            resourceToken:(NSString * _Nonnull)resourceToken
                              redirectURL:(NSURL * _Nonnull)redirectURL
                           preferences:(TrueLayerMandatePreferences * _Nonnull)preferences;
@end

#endif /* TrueLayerMandateContext_h */

#ifndef TrueLayerSinglePaymentPreferences_h
#define TrueLayerSinglePaymentPreferences_h

#import <UIKit/UIKit.h>

/// A set of preferences that can be applied to a payment.
@interface TrueLayerSinglePaymentPreferences: NSObject
/// The preferred country to use when displaying the providers.
///
/// If the country is invalid, or doesn't include any providers, the value will fallback to the user's locale.
@property (nonatomic, readwrite, copy) NSString * _Nullable preferredCountryCode;

/// The `UIViewController` to present the SDK on.
@property (nonatomic, readwrite, copy) UIViewController * _Nonnull viewController;

/// Initializes a new Preferences object.
/// - Parameters:
///   - preferredCountryCode: The preferred country to use when displaying the providers.
///   - viewController: The `UIViewController` to present the SDK on.
- (nonnull instancetype)initWithPreferredCountryCode:(NSString * _Nullable)preferredCountryCode
                                      viewController:(UIViewController * _Nonnull)viewController;
@end

#endif /* TrueLayerSinglePaymentPreferences_h */

#ifndef TrueLayerSinglePaymentPreferences_h
#define TrueLayerSinglePaymentPreferences_h

#import <UIKit/UIKit.h>

/// A set of preferences that can be applied to a mandate.
@interface TrueLayerMandatePreferences: NSObject
/// The `UIViewController` to present the SDK on.
@property (nonatomic, readwrite, copy) UIViewController * _Nonnull viewController;

/// Initializes a new Preferences object.
/// - Parameters:
///   - preferredCountryCode: The preferred country to use when displaying the providers.
- (nonnull instancetype)initWithViewController:(UIViewController * _Nullable)viewController;
@end

#endif /* TrueLayerSinglePaymentPreferences_h */

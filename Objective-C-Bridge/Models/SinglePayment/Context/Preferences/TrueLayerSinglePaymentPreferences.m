#import "TrueLayerSinglePaymentPreferences.h"

@implementation TrueLayerSinglePaymentPreferences

- (instancetype)initWithPreferredCountryCode:(NSString *)preferredCountryCode
                              viewController:(UIViewController *)viewController {
  self = [super init];
  if (self) {
    self.preferredCountryCode = preferredCountryCode;
    self.viewController = viewController;
  }
  return self;
}

@end

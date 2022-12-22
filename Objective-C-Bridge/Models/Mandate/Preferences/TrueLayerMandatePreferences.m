#import "TrueLayerMandatePreferences.h"

@implementation TrueLayerMandatePreferences

- (instancetype)initWithViewController:(UIViewController *)viewController {
  self = [super init];
  if (self) {
    self.viewController = viewController;
  }
  return self;
}

@end

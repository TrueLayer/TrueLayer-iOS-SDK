#import "TrueLayerSinglePaymentContext.h"

@implementation TrueLayerSinglePaymentContext

- (instancetype)initWithPaymentID:(NSString *)paymentID
                    resourceToken:(NSString *)resourceToken
                      redirectURL:(NSURL *)redirectURL
                   viewController:(UIViewController *)viewController {
  self = [super init];
  if (self) {
    self.paymentID = paymentID;
    self.resourceToken = resourceToken;
    self.redirectURL = redirectURL;
    self.viewController = viewController;
  }
  return self;
}

@end

#import "TrueLayerMandateContext.h"

@implementation TrueLayerMandateContext

- (instancetype)initWithMandateID:(NSString *)mandateID
                    resourceToken:(NSString *)resourceToken
                      redirectURL:(NSURL *)redirectURL
                   viewController:(UIViewController *)viewController {
  self = [super init];
  if (self) {
    self.mandateID = mandateID;
    self.resourceToken = resourceToken;
    self.redirectURL = redirectURL;
    self.viewController = viewController;
  }
  return self;
}

@end

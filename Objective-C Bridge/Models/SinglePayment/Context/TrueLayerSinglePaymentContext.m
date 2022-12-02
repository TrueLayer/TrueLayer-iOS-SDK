#import "TrueLayerSinglePaymentContext.h"

@implementation TrueLayerSinglePaymentContext

- (instancetype)initWithPaymentID:(NSString *)paymentID
                    resourceToken:(NSString *)resourceToken
                      redirectURL:(NSURL *)redirectURL
                   preferences:(TrueLayerSinglePaymentPreferences *)preferences {
  self = [super init];
  if (self) {
    self.paymentID = paymentID;
    self.resourceToken = resourceToken;
    self.redirectURL = redirectURL;
    self.preferences = preferences;
  }
  return self;
}

@end

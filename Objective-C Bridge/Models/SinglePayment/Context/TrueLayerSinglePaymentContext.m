#import "TrueLayerSinglePaymentContext.h"

@implementation TrueLayerSinglePaymentContext

- (instancetype)initWithIdentifier:(NSString *)identifier
                    resourceToken:(NSString *)resourceToken
                      redirectURL:(NSURL *)redirectURL
                   preferences:(TrueLayerSinglePaymentPreferences *)preferences {
  self = [super init];
  if (self) {
    self.identifier = identifier;
    self.resourceToken = resourceToken;
    self.redirectURL = redirectURL;
    self.preferences = preferences;
  }
  return self;
}

@end

#import "TrueLayerMandateContext.h"

@implementation TrueLayerMandateContext

- (instancetype)initWithIdentifier:(NSString *)identifier
                    resourceToken:(NSString *)resourceToken
                      redirectURL:(NSURL *)redirectURL
                   preferences:(TrueLayerMandatePreferences *)preferences {
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

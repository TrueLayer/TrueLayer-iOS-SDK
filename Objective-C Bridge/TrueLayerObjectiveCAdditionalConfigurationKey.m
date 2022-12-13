#import <Foundation/Foundation.h>
#import "TrueLayerObjectiveCAdditionalConfigurationKey.h"
#import "TrueLayerPaymentsSDK-Swift.h"

@implementation TrueLayerObjectiveCAdditionalConfigurationKey

+ (NSString *)integrationType {
  return [TrueLayerAdditionalConfigurationKey integrationType];
}

+ (NSString *)integrationVersion {
  return [TrueLayerAdditionalConfigurationKey integrationVersion];
}

@end

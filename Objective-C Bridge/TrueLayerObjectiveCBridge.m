#import <Foundation/Foundation.h>
#import "TrueLayerObjectiveCBridge.h"
#import "TrueLayerPaymentsSDK-Swift.h"

@implementation TrueLayerObjectiveCBridge

+ (void)configureWith:(NSString *)environment
                error:(NSError * _Nullable __autoreleasing *)error {
  [TrueLayerBridge configureWith:environment error:error];
}

@end

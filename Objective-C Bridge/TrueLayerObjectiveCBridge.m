#import <Foundation/Foundation.h>
#import "TrueLayerObjectiveCBridge.h"
#import "TrueLayerPaymentsSDK-Swift.h"

@implementation TrueLayerObjectiveCBridge

+ (void)configureWith:(TrueLayerObjectiveCEnvironment)environment {
  TrueLayerEnvironment trueLayerEnvironment;
  
  switch (environment) {
    case TrueLayerObjectiveCEnvironmentSandbox:
      trueLayerEnvironment = TrueLayerEnvironmentSandbox;
      break;
   
    case TrueLayerObjectiveCEnvironmentProduction:
      trueLayerEnvironment = TrueLayerEnvironmentProduction;
      break;
  }
  
  [TrueLayerBridge configureWith:trueLayerEnvironment];
}

@end

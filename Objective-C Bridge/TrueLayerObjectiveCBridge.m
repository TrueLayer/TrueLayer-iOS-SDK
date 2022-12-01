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

+ (void)processSinglePaymentWithContext:(TrueLayerSinglePaymentContext * _Nonnull)context
                                success:(void (^ _Nonnull)(enum TrueLayerSinglePaymentObjCState))success
                                failure:(void (^ _Nonnull)(enum TrueLayerSinglePaymentObjCError))failure {
  
  [TrueLayerBridge processSinglePaymentWithContext:context
                                           success:^(enum TrueLayerSinglePaymentState state) {
    // Create the public objC enum to send back to the merchant.
    TrueLayerSinglePaymentObjCState objCState;
    
    switch (state) {
      case TrueLayerSinglePaymentStateAuthorized:
        objCState = TrueLayerSinglePaymentObjCStateAuthorized;
        break;
        
      case TrueLayerSinglePaymentStateExecuted:
        objCState = TrueLayerSinglePaymentObjCStateExecuted;
        break;

      case TrueLayerSinglePaymentStateRedirect:
        objCState = TrueLayerSinglePaymentObjCStateRedirect;
        break;

      case TrueLayerSinglePaymentStateSettled:
        objCState = TrueLayerSinglePaymentObjCStateSettled;
        break;

      case TrueLayerSinglePaymentStateWait:
        objCState = TrueLayerSinglePaymentObjCStateWait;
        break;
    }
    
    success(objCState);
    
  }
                                           failure:^(enum TrueLayerSinglePaymentError error) {
    TrueLayerSinglePaymentObjCError objCError;
    
    switch (error) {
      case TrueLayerSinglePaymentErrorAuthorizationFailed:
        objCError = TrueLayerSinglePaymentObjCErrorAuthorizationFailed;
        break;
        
      case TrueLayerSinglePaymentErrorConnectionIssues:
        objCError = TrueLayerSinglePaymentObjCErrorConnectionIssues;
        break;
        
      case TrueLayerSinglePaymentErrorGeneric:
        objCError = TrueLayerSinglePaymentObjCErrorGeneric;
        break;
        
      case TrueLayerSinglePaymentErrorInvalidToken:
        objCError = TrueLayerSinglePaymentObjCErrorInvalidToken;
        break;
        
      case TrueLayerSinglePaymentErrorPaymentExpired:
        objCError = TrueLayerSinglePaymentObjCErrorPaymentExpired;
        break;
        
      case TrueLayerSinglePaymentErrorPaymentNotFound:
        objCError = TrueLayerSinglePaymentObjCErrorPaymentNotFound;
        break;
        
      case TrueLayerSinglePaymentErrorPaymentRejected:
        objCError = TrueLayerSinglePaymentObjCErrorPaymentRejected;
        break;
        
      case TrueLayerSinglePaymentErrorSdkNotConfigured:
        objCError = TrueLayerSinglePaymentObjCErrorSdkNotConfigured;
        break;
        
      case TrueLayerSinglePaymentErrorServerError:
        objCError = TrueLayerSinglePaymentObjCErrorServerError;
        break;
        
      case TrueLayerSinglePaymentErrorUnexpectedBehavior:
        objCError = TrueLayerSinglePaymentObjCErrorUnexpectedBehavior;
        break;
        
      case TrueLayerSinglePaymentErrorUserCanceled:
        objCError = TrueLayerSinglePaymentObjCErrorUserCanceled;
        break;
    }
    
    failure(objCError);
  }];
}

@end

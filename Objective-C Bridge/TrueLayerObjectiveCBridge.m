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

+ (void)processMandateWithContext:(TrueLayerMandateContext *)context
                          success:(void (^)(enum TrueLayerMandateObjCState))success
                          failure:(void (^)(enum TrueLayerMandateObjCError))failure {
  [TrueLayerBridge processMandateWithContext:context
                                     success:^(enum TrueLayerMandateState state) {
    // Create the public objC enum to send back to the merchant.
    TrueLayerMandateObjCState objCState;
    
    switch (state) {
      case TrueLayerMandateStateAuthorized:
        objCState = TrueLayerMandateObjCStateAuthorized;
        break;
        
      case TrueLayerMandateStateRedirect:
        objCState = TrueLayerMandateObjCStateRedirect;
        break;
    }
    
    success(objCState);
  }
                                     failure:^(enum TrueLayerMandateError error) {
    TrueLayerMandateObjCError objCError;
    
    switch (error) {
      case TrueLayerMandateErrorAuthorizationFailed:
        objCError = TrueLayerMandateObjCErrorAuthorizationFailed;
        break;
        
      case TrueLayerMandateErrorConnectionIssues:
        objCError = TrueLayerMandateObjCErrorConnectionIssues;
        break;
        
      case TrueLayerMandateErrorGeneric:
        objCError = TrueLayerMandateObjCErrorGeneric;
        break;
        
      case TrueLayerMandateErrorInvalidToken:
        objCError = TrueLayerMandateObjCErrorInvalidToken;
        break;
        
      case TrueLayerMandateErrorMandateExpired:
        objCError = TrueLayerMandateObjCErrorMandateExpired;
        break;
        
      case TrueLayerMandateErrorMandateNotFound:
        objCError = TrueLayerMandateObjCErrorMandateNotFound;
        break;
        
      case TrueLayerMandateErrorMandateRejected:
        objCError = TrueLayerMandateObjCErrorMandateRejected;
        break;
        
      case TrueLayerMandateErrorRevoked:
        objCError = TrueLayerMandateObjCErrorRevoked;
        break;
        
      case TrueLayerMandateErrorSdkNotConfigured:
        objCError = TrueLayerMandateObjCErrorSdkNotConfigured;
        break;
        
      case TrueLayerMandateErrorServerError:
        objCError = TrueLayerMandateObjCErrorServerError;
        break;
        
      case TrueLayerMandateErrorUnexpectedBehavior:
        objCError = TrueLayerMandateObjCErrorUnexpectedBehavior;
        break;
        
      case TrueLayerMandateErrorUserCanceled:
        objCError = TrueLayerMandateObjCErrorUserCanceled;
        break;
    }
    
    failure(objCError);
  }];
}

@end

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
    TrueLayerSinglePaymentObjCError objCError = [TrueLayerObjectiveCBridge singlePaymentObjCErrorFromSinglePaymentError:error];
    failure(objCError);
  }];
}

+ (void)singlePaymentStatusWithPaymentIdentifier:(NSString *)paymentIdentifier resourceToken:(NSString *)resourceToken
                                         success:(void (^)(enum TrueLayerSinglePaymentObjCStatus))success
                                         failure:(void (^)(enum TrueLayerSinglePaymentObjCError))failure {
  [TrueLayerBridge singlePaymentStatusWithPaymentIdentifier:paymentIdentifier
                                              resourceToken:resourceToken
                                                    success:^(enum TrueLayerSinglePaymentStatus status) {
    TrueLayerSinglePaymentObjCStatus objCStatus;
    
    switch (status) {
      case TrueLayerSinglePaymentStatusAuthorizationRequired:
        objCStatus = TrueLayerSinglePaymentObjCStatusAuthorizationRequired;
        break;
        
      case TrueLayerSinglePaymentStatusAuthorizing:
        objCStatus = TrueLayerSinglePaymentObjCStatusAuthorizing;
        break;
        
      case TrueLayerSinglePaymentStatusAuthorized:
        objCStatus = TrueLayerSinglePaymentObjCStatusAuthorized;
        break;
        
      case TrueLayerSinglePaymentStatusExecuted:
        objCStatus = TrueLayerSinglePaymentObjCStatusExecuted;
        break;
        
      case TrueLayerSinglePaymentStatusSettled:
        objCStatus = TrueLayerSinglePaymentObjCStatusSettled;
        break;
        
      case TrueLayerSinglePaymentStatusFailed:
        objCStatus = TrueLayerSinglePaymentObjCStatusFailed;
        break;
    }
    
    success(objCStatus);
  }
                                                    failure:^(enum TrueLayerSinglePaymentError error) {
    TrueLayerSinglePaymentObjCError objCError = [TrueLayerObjectiveCBridge singlePaymentObjCErrorFromSinglePaymentError:error];
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

// MARK: -  Helpers

/// Converts an @objc Swift error enum to a native Objective-C `TrueLayerSinglePaymentObjCError`.
/// - Parameter error: The @objc Swift error to convert.
+ (TrueLayerSinglePaymentObjCError)singlePaymentObjCErrorFromSinglePaymentError:(TrueLayerSinglePaymentError) error {
  switch (error) {
    case TrueLayerSinglePaymentErrorAuthorizationFailed:
      return TrueLayerSinglePaymentObjCErrorAuthorizationFailed;
      
    case TrueLayerSinglePaymentErrorConnectionIssues:
      return TrueLayerSinglePaymentObjCErrorConnectionIssues;
      
    case TrueLayerSinglePaymentErrorGeneric:
      return TrueLayerSinglePaymentObjCErrorGeneric;
      
    case TrueLayerSinglePaymentErrorInvalidToken:
      return TrueLayerSinglePaymentObjCErrorInvalidToken;
      
    case TrueLayerSinglePaymentErrorPaymentExpired:
      return TrueLayerSinglePaymentObjCErrorPaymentExpired;
      
    case TrueLayerSinglePaymentErrorPaymentNotFound:
      return TrueLayerSinglePaymentObjCErrorPaymentNotFound;
      
    case TrueLayerSinglePaymentErrorPaymentRejected:
      return TrueLayerSinglePaymentObjCErrorPaymentRejected;
      
    case TrueLayerSinglePaymentErrorSdkNotConfigured:
      return TrueLayerSinglePaymentObjCErrorSdkNotConfigured;
      
    case TrueLayerSinglePaymentErrorServerError:
      return TrueLayerSinglePaymentObjCErrorServerError;
      
    case TrueLayerSinglePaymentErrorUnexpectedBehavior:
      return TrueLayerSinglePaymentObjCErrorUnexpectedBehavior;
      
    case TrueLayerSinglePaymentErrorUserCanceled:
      return TrueLayerSinglePaymentObjCErrorUserCanceled;
  }
}

@end

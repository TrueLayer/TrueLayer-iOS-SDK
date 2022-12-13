import Foundation
import TrueLayerSDK

/// A bridging class to use the `TrueLayerSDK.TrueLayer.Payments.Manager` in Objective-C projects.
@objc
public class TrueLayerBridge: NSObject {
  /// Configures and sets up the SDK for a given environment.
  /// - Parameter environment: The environment to set up the SDK with.
  @objc
  public static func configure(with environment: TrueLayerEnvironment) {
    configure(with: environment, additionalConfiguration: [:])
  }
    
  /// Configures and sets up the SDK for a given environment.
  /// - Parameters:
  ///   - environment: The environment to set up the SDK with.
  ///   - additionalConfiguration: A dictionary with extra information to configure the SDK.
  @objc
  public static func configure(
    with environment: TrueLayerEnvironment,
    additionalConfiguration: [String: String]
  ) {
    let trueLayerEnvironment: TrueLayer.Environment

    switch environment {
      case .sandbox:
        trueLayerEnvironment = .sandbox

      case .production:
        trueLayerEnvironment = .production
    }

    TrueLayer.Payments.manager.configure(
      environment: trueLayerEnvironment,
      additionalConfiguration: additionalConfiguration
    )
  }
    
  /// Presents the SDK in the app to carry out a payment.
  ///
  /// This method can be called multiple times to process different payments.
  /// Before using this method, make sure that the SDK has been started, otherwise it will raise an error.
  /// - Parameters:
  ///   - context: an object that contains all the information required for the payment and to customise how the SDK behaves.
  ///   - success: A closure called when the payment authorisation flow has been successful within the scope of the SDK. A enum is passed with the state of the payment.
  ///   - failure: A closure called when the payment authorization flow has failed within the scope of the SDK, passing a given error.
  @objc
  public static func processSinglePayment(
    context: TrueLayerSinglePaymentContext,
    success: @escaping (TrueLayerSinglePaymentState) -> Void,
    failure: @escaping (TrueLayerSinglePaymentError) -> Void
  ) {
    let preferences = TrueLayer.Payments.Models.SinglePayment.Preferences(
      presentationStyle: .present(on: context.preferences.viewController),
      preferredCountryCode: context.preferences.preferredCountryCode
    )
    let context = TrueLayer.Payments.Models.SinglePayment.Context(
      identifier: context.identifier,
      token: context.resourceToken,
      redirectURL: context.redirectURL,
      preferences: preferences
    )
    
    TrueLayer.Payments.manager.processSinglePayment(context: context) { result in
      switch result {
        case .success(let state):
          success(TrueLayerSinglePaymentState(state));
          
        case .failure(let error):
          failure(TrueLayerSinglePaymentError(error))
      }
    }
  }
  
  /// Fetches the status of a single payment given its identifier and security token.
  /// - Parameters:
  ///   - paymentIdentifier: The unique identifier of the payment.
  ///   - resourceToken: The security token associated with the payment.
  ///   - success: A closure called when the payment status has been successfully fetched.
  ///   - failure: A closure called when there was an error fetching the payment status.
  @objc
  public static func singlePaymentStatus(
    paymentIdentifier: String,
    resourceToken: String,
    success: @escaping (TrueLayerSinglePaymentStatus) -> Void,
    failure: @escaping (TrueLayerSinglePaymentError) -> Void
  ) {
    Task {
      do {
        let status = try await TrueLayer.Payments.manager.singlePaymentStatus(paymentIdentifier: paymentIdentifier, resourceToken: resourceToken)
        
        success(TrueLayerSinglePaymentStatus(status))
        
      } catch {
        let singlePaymentError: TrueLayerSinglePaymentError
        
        if let error = error as? TrueLayer.Payments.Models.SinglePayment.Error {
          singlePaymentError = TrueLayerSinglePaymentError(error)
        } else {
          singlePaymentError = .unexpectedBehavior
        }
        
        failure(singlePaymentError)
      }
    }
  }
  
  /// Presents the SDK in the app to carry out a mandate.
  ///
  /// This method can be called multiple times to process different mandates.
  /// Before using this method, make sure that the SDK has been started, otherwise it will raise an error.
  /// - Parameters:
  ///   - context: an object that contains all the information required for the mandate and to customise how the SDK behaves.
  ///   - success: A closure called when the mandate authorisation flow has been successful within the scope of the SDK. A enum is passed with the state of the mandate.
  ///   - failure: A closure called when the mandate authorization flow has failed within the scope of the SDK, passing a given error.
  @objc
  public static func processMandate(
    context: TrueLayerMandateContext,
    success: @escaping (TrueLayerMandateState) -> Void,
    failure: @escaping (TrueLayerMandateError) -> Void
  ) {
    let preferences = TrueLayer.Payments.Models.Mandate.Preferences(presentationStyle: .present(on: context.preferences.viewController))
    let context = TrueLayer.Payments.Models.Mandate.Context(
      identifier: context.identifier,
      token: context.resourceToken,
      redirectURL: context.redirectURL,
      preferences: preferences
    )
    
    TrueLayer.Payments.manager.processMandate(context: context) { result in
      switch result {
        case .success(let state):
          success(TrueLayerMandateState(state));
          
        case .failure(let error):
          failure(TrueLayerMandateError(error))
      }
    }
  }
  
  /// Fetches the status of a mandate given its identifier and security token.
  /// - Parameters:
  ///   - mandateIdentifier: The unique identifier of the mandate.
  ///   - resourceToken: The security token associated with the mandate.
  ///   - success: A closure called when the mandate status has been successfully fetched.
  ///   - failure: A closure called when there was an error fetching the mandate status.
  @objc
  public static func mandateStatus(
    mandateIdentifier: String,
    resourceToken: String,
    success: @escaping (TrueLayerMandateStatus) -> Void,
    failure: @escaping (TrueLayerMandateError) -> Void
  ) {
    Task {
      do {
        let status = try await TrueLayer.Payments.manager.mandateStatus(mandateIdentifier: mandateIdentifier, resourceToken: resourceToken)
        
        success(TrueLayerMandateStatus(status))
        
      } catch {
        let mandateError: TrueLayerMandateError
        
        if let error = error as? TrueLayer.Payments.Models.Mandate.Error {
          mandateError = TrueLayerMandateError(error)
        } else {
          mandateError = .unexpectedBehavior
        }
        
        failure(mandateError)
      }
    }
  }
}

import Foundation
import TrueLayerSDK

@objc
final public class TrueLayerPaymentsManager: NSObject {
  /// The shared instance of the manager to use.
  @objc static let shared = TrueLayerPaymentsManager()
  
  @objc
  /// Configures the `SDK`.
  ///
  /// This method should be called once and only once. Failing to do so will result in the `SDK` throwing an error.
  ///
  /// - Note: this method is thread-safe.
  /// - Parameters:
  ///   - environment: The environment to use throughout the SDK authorization flows.
  ///   - additionalConfiguration: Additional configuration values to use to set up the SDK.
  public static func configure(
    environment: TrueLayerEnvironment,
    additionalConfiguration: [String: String]
  ) {
    var configuration = additionalConfiguration.reduce(into: [TrueLayer.Payments.AdditionalConfiguration.Key: String]()) {
      guard let key = Self.sdkKey(from: $1.key) else {
        return
      }
      
      $0[key] = $1.value
    }
    
    if additionalConfiguration[TrueLayer.Payments.AdditionalConfiguration.Key.customIntegrationType.rawValue] == nil {
      configuration[.customIntegrationType] = "ObjectiveC"
    }
    
    TrueLayer.Payments.manager.configure(environment: environment.sdkEnvironment, additionalConfiguration: configuration)
  }
  
  // MARK: Single Payment

  /// It presents the SDK in the app to carry out a payment.
  ///
  /// This method can be called multiple times to process different payments.
  /// Before using this method, make sure that the SDK has been started, otherwise it will raise an error.
  ///
  /// - Note: this method is thread-safe.
  ///
  /// - Parameters:
  ///   - context: an object that contains all the information required for the payment and to customise how the SDK behaves.
  ///   - success: a completion handler to execute in case of success.
  ///   - failure: a completion handler to execute in case of failure.
  @objc
  public static func processSinglePayment(
    context: TrueLayerSinglePaymentContext,
    success: @escaping (TrueLayerSinglePaymentState) -> Void,
    failure: @escaping (TrueLayerSinglePaymentError) -> Void
  ) {
    TrueLayer.Payments.manager.processSinglePayment(context: context.sdkContext()) { result in
      switch result {
        case .success(let state):
          success(TrueLayerSinglePaymentState(state));
          
        case .failure(let error):
          failure(TrueLayerSinglePaymentError(error))
      }
    }
  }
  
  // MARK: Mandate

  /// It presents the SDK in the app to carry out a mandate.
  ///
  /// This method can be called multiple times to process different mandates.
  /// Before using this method, make sure that the SDK has been started, otherwise it will raise an error.
  ///
  /// - Note: this method is thread-safe.
  ///
  /// - Parameters:
  ///   - context: an object that contains all the information required for the payment and to customise how the SDK behaves.
  ///   - success: a completion handler to execute in case of success.
  ///   - failure: a completion handler to execute in case of failure.
  @objc
  public static func processMandate(
    context: TrueLayerMandateContext,
    success: @escaping (TrueLayerMandateState) -> Void,
    failure: @escaping (TrueLayerMandateError) -> Void
  ) {
    TrueLayer.Payments.manager.processMandate(context: context.sdkContext()) { result in
      switch result {
        case .success(let state):
          success(TrueLayerMandateState(state));
          
        case .failure(let error):
          failure(TrueLayerMandateError(error))
      }
    }
  }
}


extension TrueLayerPaymentsManager {
  /// Transforms a `String` into a `TrueLayer.Payments.AdditionalConfiguration.Key`.
  /// - Parameter string: The string value to convert.
  /// - Returns: A `key` if convertable, or nil.
  private static func sdkKey(from string: String) -> TrueLayer.Payments.AdditionalConfiguration.Key? {
    if string == TrueLayer.Payments.AdditionalConfiguration.Key.customIntegrationType.rawValue {
      return .customIntegrationType
    }
    
    if string == TrueLayer.Payments.AdditionalConfiguration.Key.customIntegrationVersion.rawValue {
      return .customIntegrationVersion
    }
    
    return nil
  }
}

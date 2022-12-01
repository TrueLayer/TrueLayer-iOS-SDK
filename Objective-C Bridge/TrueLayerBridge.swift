import Foundation
import TrueLayerSDK

/// A bridging class to use the `TrueLayerSDK.TrueLayer.Payments.Manager` in Objective-C projects.
@objc
public class TrueLayerBridge: NSObject {
  /// Configures and sets up the SDK for a given environment.
  /// - Parameter environment: The environment to set up the SDK with.
  @objc
  public static func configure(with environment: TrueLayerEnvironment) {
    let trueLayerEnvironment: TrueLayer.Environment

    switch environment {
      case .sandbox:
        trueLayerEnvironment = .sandbox

      case .production:
        trueLayerEnvironment = .production
    }

    TrueLayer.Payments.manager.configure(environment: trueLayerEnvironment)
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
    let preferences = TrueLayer.Payments.Models.SinglePayment.Preferences(presentationStyle: .present(on: context.viewController))
    let context = TrueLayer.Payments.Models.SinglePayment.Context(
      identifier: context.paymentID,
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
}

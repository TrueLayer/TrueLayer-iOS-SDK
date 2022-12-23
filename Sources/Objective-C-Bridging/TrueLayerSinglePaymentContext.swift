import Foundation
import TrueLayerSDK

@objc
final public class TrueLayerSinglePaymentContext: NSObject {
  /// The unique identifier of the payment.
  @objc
  public let identifier: String

  /// The security token associated with the payment.
  @objc
  public let token: String

  /// The destination where the user should be redirected once the authorization flow is done outside of the app (bank website, HPP).
  @objc
  public let redirectURL: URL

  /// The optional preferences to apply to the payment.
  @objc
  public let preferences: TrueLayerSinglePaymentsPreferences

  /// Creates and returns an instance of `Context`.
  /// - Parameters:
  ///   - identifier: The unique identifier of the payment.
  ///   - token: The security token associated with the payment.
  ///   - redirectURL: The destination where the user should be redirected once the authorization flow is done outside of the app.
  ///   - preferences: The preferences to apply to the payment.
  @objc
  public init(
    identifier: String,
    token: String,
    redirectURL: URL,
    preferences: TrueLayerSinglePaymentsPreferences
  ) {
    self.identifier = identifier
    self.token = token
    self.redirectURL = redirectURL
    self.preferences = preferences
  }
  
  /// Converts the `TrueLayerSinglePaymentContext` into `TrueLayer.Payments.Models.SinglePayment.Context`.
  func sdkContext() -> TrueLayer.Payments.Models.SinglePayment.Context {
    TrueLayer.Payments.Models.SinglePayment.Context(
      identifier: identifier,
      token: token,
      redirectURL: redirectURL,
      preferences: preferences.sdkPreferences()
    )
  }
}

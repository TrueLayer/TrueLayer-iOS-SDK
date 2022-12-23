import Foundation
import TrueLayerSDK

/// A set of preferences that can be applied to a single payment.
@objc
final public class TrueLayerSinglePaymentsPreferences: NSObject {
  /// The preferred country to use when displaying the providers.
  ///
  /// If the country is invalid, or doesn't include any providers, the value will fallback to the user's locale.
  @objc let preferredCountryCode: String?
  
  /// The presentation style of the SDK.
  @objc let presentationStyle: TrueLayerPresentationStyle
  
  /// Creates a new instance of Preferences. All values default to `nil`.
  /// - Parameter presentationStyle: The presentation style of the SDK.
  /// - Parameter preferredCountryCode: The preferred country to use when displaying the providers.
  @objc
  public init(
    presentationStyle: TrueLayerPresentationStyle,
    preferredCountryCode: String? = nil
  ) {
    self.presentationStyle = presentationStyle
    self.preferredCountryCode = preferredCountryCode
  }
  
  /// Converts the `TrueLayerSinglePaymentsPreferences` into `TrueLayer.Payments.Models.SinglePayment.Preferences`.
  func sdkPreferences() -> TrueLayer.Payments.Models.SinglePayment.Preferences {
    TrueLayer.Payments.Models.SinglePayment.Preferences(
      presentationStyle: presentationStyle.style,
      preferredCountryCode: preferredCountryCode
    )
  }
}

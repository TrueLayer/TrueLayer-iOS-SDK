import Foundation
import TrueLayerSDK

/// A set of preferences that can be applied to a mandate.
@objc
final public class TrueLayerMandatePreferences: NSObject {
  /// The presentation style of the SDK.
  @objc let presentationStyle: TrueLayerPresentationStyle
  
  /// Creates a new instance of Preferences. All values default to `nil`.
  /// - Parameter presentationStyle: The presentation style of the SDK.
  @objc
  public init(presentationStyle: TrueLayerPresentationStyle) {
    self.presentationStyle = presentationStyle
  }
  
  /// Converts the `TrueLayerSinglePaymentsPreferences` into `TrueLayer.Payments.Models.SinglePayment.Preferences`.
  func sdkPreferences() -> TrueLayer.Payments.Models.Mandate.Preferences {
    TrueLayer.Payments.Models.Mandate.Preferences(presentationStyle: presentationStyle.style)
  }
}

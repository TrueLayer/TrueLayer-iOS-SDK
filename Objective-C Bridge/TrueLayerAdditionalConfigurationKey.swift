import TrueLayerSDK

/// The  keys to use when customizing the additional configuration dictionary for the TrueLayerSDK.
/// These keys are returned from the TrueLayer SDK, ensuring they match what is expected.
@objc
public class TrueLayerAdditionalConfigurationKey: NSObject {
  /// The type of integration with the TrueLayer SDK, e.g. React Native.
  @objc
  public static var integrationType = "integrationType"
  
  /// The version of the integration, if necessary.
  ///
  /// This should be included if the `integrationType` is not native.
  @objc
  public static var integrationVersion = "integrationVersion"
}

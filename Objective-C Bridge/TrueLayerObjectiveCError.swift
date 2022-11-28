import Foundation

/// Errors that occur while using the Objective-C layer of the TrueLayer SDK.
@objc
public enum TrueLayerObjectiveCError: Int, Error {
  /// The environment passed to the `configure` method is invalid. Please use `"sandbox"` or `"environment"`.
  case invalidEnvironment
}

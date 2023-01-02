import UIKit
import TrueLayerSDK

@objc
public class TrueLayerPresentationStyle: NSObject {
  internal var style: TrueLayer.PresentationStyle
  
  @objc
  /// Creates an return a `TrueLayerPresentationStyle` where the `SDK` is presented in `modal`.
  /// - Parameters:
  ///   - viewController: The `UIViewController` to present on.
  ///   - style: The `modal` presentation style.
  public init(presentOn viewController: UIViewController, style: UIModalPresentationStyle = .automatic) {
    self.style = .present(on: viewController, style: style)
  }
}

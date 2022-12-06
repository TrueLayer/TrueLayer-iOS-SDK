import TrueLayerSDK

/// An implementation of `VisualSettingsProvider` that converts an Objective-C visual settings object
/// to a type used in the TrueLayerSDK.
/// This wraps around the Objective-C instance and takes any non-nil colors. Any `nil` colors will be replaced by the default colors.
struct TrueLayerVisualSettings: VisualSettingsProvider {
  /// An implementation of `ColorProvider` that converts a `TrueLayerObjCColorProvider` object to be used in the TrueLayerSDK.
  /// Any `nil` colors in `TrueLayerObjCColorProvider` will be replaced by the default colors in `DefaultVisualSettings`.
  struct Colors: ColorProvider {
    let backgroundPrimary: UIColor
    let backgroundSecondary: UIColor
    let backgroundActionPrimary: UIColor
    let backgroundCell: UIColor
    
    let contentPrimary: UIColor
    let contentSecondary: UIColor
    let contentPrimaryInverted: UIColor
    let contentAction: UIColor
    let contentError: UIColor

    let separator: UIColor
    let uiElementBorder: UIColor
    
    init(objCColorProvider: TrueLayerObjCColorProvider) {
      // The default colors from the TrueLayerSDK. We use these when the Objective-C values are `nil`.
      let defaultColors = DefaultVisualSettings().colors
      
      self.backgroundPrimary = objCColorProvider.backgroundPrimary ?? defaultColors.backgroundPrimary
      self.backgroundSecondary = objCColorProvider.backgroundSecondary ?? defaultColors.backgroundSecondary
      self.backgroundActionPrimary = objCColorProvider.backgroundActionPrimary ?? defaultColors.backgroundActionPrimary
      self.backgroundCell = objCColorProvider.backgroundCell ?? defaultColors.backgroundCell
      
      self.contentPrimary = objCColorProvider.contentPrimary ?? defaultColors.contentPrimary
      self.contentSecondary = objCColorProvider.contentSecondary ?? defaultColors.contentSecondary
      self.contentPrimaryInverted = objCColorProvider.contentPrimaryInverted ?? defaultColors.contentPrimaryInverted
      self.contentAction = objCColorProvider.contentAction ?? defaultColors.contentAction
      self.contentError = objCColorProvider.contentError ?? defaultColors.contentError
      
      self.separator = objCColorProvider.separator ?? defaultColors.separator
      self.uiElementBorder = objCColorProvider.uiElementBorder ?? defaultColors.uiElementBorder
    }
  }

  let colors: ColorProvider
  
  init(objCVisualSettings: TrueLayerObjCVisualSettingsProvider) {
    self.colors = Colors(objCColorProvider: objCVisualSettings.colorProvider)
  }
}

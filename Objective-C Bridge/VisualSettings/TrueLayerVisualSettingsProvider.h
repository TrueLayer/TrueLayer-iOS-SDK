#ifndef TrueLayerVisualSettingsProvider_h
#define TrueLayerVisualSettingsProvider_h

#import <UIKit/UIKit.h>
#import "TrueLayerObjCMakeup.h"

/// The list of all used colors throughout the `SDK`.
/// Customizing these values will allow the integrator to have a more linear visual experience throughout his app.
@protocol TrueLayerObjCColorProvider <NSObject, TrueLayerObjCMakeup>
@end

/// An object providing all the necessary pieces to customize the visual aspect of the `SDK`.
///
/// All values fallback to a default one making easy to customize only the desired bits.
/// The following pieces can be customized:
/// - The colors, be it of the background, content etc.. All colors can be modified.
///   They are not passed as single colors but as a pair inside `ChameleonColor`.
///   The light color will be used in light mode, and the dark one in dark mode.
@protocol TrueLayerObjCVisualSettingsProvider <NSObject>
/// The colors to use for components in the `SDK`.
@property (nonatomic, retain) id<TrueLayerObjCColorProvider> colorProvider;

@end

#endif /* TrueLayerVisualSettingsProvider_h */
